/*
 * jacobi-stat - Keep track of Jacobi +-0 v(1) stats
 *
 * Copyright (c) 2019 by Landon Curt Noll.  All Rights Reserved.
 *
 * Permission to use, copy, modify, and distribute this software and
 * its documentation for any purpose and without fee is hereby granted,
 * provided that the above copyright, this permission notice and text
 * this comment, and the disclaimer below appear in all of the following:
 *
 *       supporting documentation
 *       source copies
 *       source works derived from this source
 *       binaries derived from this source or from derived source
 *
 * LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
 * EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
 * USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
 * OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THIS SOFTWARE.
 *
 * chongo (Landon Curt Noll, http://www.isthe.com/chongo/index.html) /\oo/\
 *
 * Share and enjoy! :-)
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>

#include "debug.h"
#include "jacobi-parse.h"
#include "jacobi-stat.h"

/* forward static declarations */
static int count_cmp(const void *a_arg, const void *b_arg);
static int amount_cmp(const void *a_arg, const void *b_arg);

/*
 * tally_init - initialize a Jacobi tally
 *
 * given:
 *	tally_p		pointer to a tally
 *
 * NOTE: This function does not return on error.
 */
void
tally_init(tally *tally_p)
{
    int64_t i;

    /*
     * firewall
     */
    if (tally_p == NULL) {
	err(100, __func__, "tally_p is NULL");
	/*NOTREACHED*/
    }

    /*
     * allocate the array to the default size
     *
     * Because the count array, when sorted_by_amount is true, starts with the amount value of 0.
     *
     * We start out with the DEF_MAX_V1+1+1 elements.  The +1 on count_alloc is because
     * we start with the element for 0.
     */
    tally_p->count_alloc = DEF_MAX_V1+1;
    tally_p->count = (count *) malloc(sizeof(tally_p->count[0]) * (tally_p->count_alloc));
    if (tally_p->count == NULL) {
	errp(100, __func__, "count: cannot malloc %u objects", tally_p->count_alloc);
	/*NOTREACHED*/
    }
    for (i=0; i < tally_p->count_alloc; ++i) {
	tally_p->count[i].count = 0;
	tally_p->count[i].amount = i;
    }

    /*
     * clear tally stats
     */
    tally_p->non_zero_count = 0;
    tally_p->out_of_range = 0;
    tally_p->sorted_by_amount = true;
    return;
}


/*
 * cache_init - initialize a Jacobi symbol cache
 *
 * given:
 *	cache_p		pointer to a cache
 *
 * NOTE: This function does not return on error.
 */
void
cache_init(cache *cache_p)
{
    /*
     * firewall
     */
    if (cache_p == NULL) {
	err(101, __func__, "cache_p is NULL");
	/*NOTREACHED*/
    }

    /*
     * allocate arrays to the default size
     *
     * NOTE: The Jacobi +-0 value string starts with the hard coded value for Jacobi(0, h*2^n-1) == '0'.
     *       Thus, for X == 1 (i.e., Jacobi(1, ch*2^n-1)), the 2nd jacobi_str character or jacobi_str[1] is used.
     *
     * NOTE: The Jacobi cahce array starts with the hard coded value for Jacobi(0, h*2^n-1) == 0.
     *       Thus, for X == 1 (i.e., Jacobi(1, ch*2^n-1)), the 2nd Jacobi cahce element jcache[1] is used.
     *
     * We start out with the DEF_MAX_X+1 elements.  The +1 on jcache_alloc is because we start with element 0.
     */
    cache_p->jcache_alloc = DEF_MAX_X+1;
    cache_p->jcache = (int8_t *) malloc(sizeof(cache_p->jcache[0]) * cache_p->jcache_alloc);
    if (cache_p->jcache == NULL) {
	errp(101, __func__, "jcache: cannot malloc %u int8_t values", cache_p->jcache_alloc);
	/*NOTREACHED*/
    }
    memset(cache_p->jcache, INVALID_JACOBI_VALUE, cache_p->jcache_alloc);

    /*
     * clear cache stats
     */
    cache_p->jcache_use = 0;
    cache_p->cache_load_count = 0;
    cache_p->cache_hit_count = 0;
    cache_p->out_of_range = 0;
    cache_p->invalid_str_value = 0;
    return;
}


/*
 * cache_config - configure a Jacobi symbol cache for a Jacobi +-0 line
 *
 * given:
 *	cache_p		pointer to a cache that has been initialized
 *	len		length of the Jacobi +-0 line in octets
 *
 * NOTE: This function does not return on error.
 */
void
cache_config(cache *cache_p, ssize_t len)
{
    /*
     * firewall
     */
    if (cache_p == NULL) {
	err(102, __func__, "cache_p is NULL");
	/*NOTREACHED*/
    }
    if (len < JACOBI_MIN_LEN) {
	err(102, __func__, "Jacobi +-0 line len: %d < %d",
		 len, JACOBI_MIN_LEN);
	/*NOTREACHED*/
    }
    if (cache_p->jcache == NULL) {
	err(102, __func__, "cache_p->jcache is NULL");
	/*NOTREACHED*/
    }

    /*
     * expand the cache if needed
     */
    if ((size_t)len < cache_p->jcache_alloc) {
    	cache_p->jcache = realloc(cache_p->jcache, len);
	if (cache_p->jcache == NULL) {
	    errp(102, __func__, "cannot realloc jcache from %u to %d",
	    	      cache_p->jcache_alloc, len);
	    /*NOTREACHED*/
	}
	cache_p->jcache_alloc = (size_t) len;
    }

    /*
     * configure the cache
     */
    memset(cache_p->jcache, INVALID_JACOBI_VALUE, len*sizeof(cache_p->jcache[0]));

    /*
     * configure the cache stats
     */
    cache_p->jcache_use = (size_t) len;
    cache_p->cache_load_count = 0;
    cache_p->cache_hit_count = 0;
    cache_p->out_of_range = 0;
    cache_p->invalid_str_value = 0;
    return;
}


/*
 * lookup_jacobi - look up a Jacobi value in a Jacobi +-0 string via Jacobi cache
 *
 * given:
 *	jstr		pointer to a Jacobi +-0 string
 *	x		the value to lookup in the string
 *	cache_p		pointer to a cache that has been configurd
 *
 * returns:
 *	-1, 0, 1		if x was in the Jacobi +-0 string and/or cache
 *	INVALID_JACOBI_VALUE	if x is outside of the range of the string/cache
 *
 * This function maintains the Jacobi cache stats.
 *
 * The first string value, jstr[0], and first cache value cache_p->jcache[0],
 * is used for x == 0.  The largest value in cache is cache_p->jcache_use-1.
 */
int8_t
lookup_jacobi(char *jstr, size_t x, cache *cache_p)
{
    /*
     * firewall
     */
    if (jstr == NULL) {
	err(103, __func__, "jstr is NULL");
	/*NOTREACHED*/
    }
    if (cache_p == NULL) {
	err(103, __func__, "cache_p is NULL");
	/*NOTREACHED*/
    }
    if (cache_p->jcache == NULL) {
	err(103, __func__, "cache_p->jcache is NULL");
	/*NOTREACHED*/
    }
    if (cache_p->jcache_use <= 0) {
	err(103, __func__, "cache_p->jcache_use <= 0, "
		 "perhaps cache was never configured");
	/*NOTREACHED*/
    }

    /*
     * firewall - deal with out of range x
     *
     * NOTE: Because x is unsigned, we do not check for x < 0.
     */
    if (x >= cache_p->jcache_use) {
	/* note and return invalid Jacobi value */
	++cache_p->out_of_range;
	return INVALID_JACOBI_VALUE;
    }

    /*
     * first check cache
     *
     * When the cache was configured, and when it contained no Jacobi symbol
     * values, the cache is filled with INVALID_JACOBI_VALUE values.
     * Therefore, if the cache element == INVALID_JACOBI_VALUE, then that
     * value has not yet been set from the jstr.
     */
    if (cache_p->jcache[x] != INVALID_JACOBI_VALUE) {

	/*
	 * record cache hit
	 */
	++cache_p->cache_hit_count;

	/*
	 * return the Jacobi cache value
	 */
	return cache_p->jcache[x];
    }

    /*
     * The jacobi value has not yet been cached, so we fetch the Jacobi value
     * from the jstr.
     */
     switch (jstr[x]) {
     case '-':
	cache_p->jcache[x] = -1;
	++cache_p->cache_load_count;
	break;
     case '0':
	cache_p->jcache[x] = 0;
	++cache_p->cache_load_count;
	break;
     case '+':
	cache_p->jcache[x] = 1;
	++cache_p->cache_load_count;
	break;
     default:
	cache_p->jcache[x] = INVALID_JACOBI_VALUE;
	++cache_p->invalid_str_value;
	break;
     }

     /*
      * return the newly cached value
      */
     return cache_p->jcache[x];
}


/*
 * tally_value - tally a v(1) (or other) value
 *
 * given:
 *	tally_p		pointer to a tally
 *	amount		the value to tally
 *
 * NOTE: This function does not return on error.
 */
void
tally_value(tally *tally_p, int64_t amount)
{
    /*
     * firewall
     */
    if (tally_p == NULL) {
	err(104, __func__, "tally_p is NULL");
	/*NOTREACHED*/
    }
    if (tally_p->count == NULL) {
	err(104, __func__, "tally_p->count is NULL");
	/*NOTREACHED*/
    }
    if (tally_p->count_alloc <= 0) {
	err(104, __func__, "tally_p->count_alloc: %"PRIu64" <= 0",
		 tally_p->count_alloc);
	/*NOTREACHED*/
    }

    /*
     * be sure the tally is sorted by amount
     */
    if (! tally_p->sorted_by_amount) {
	sort_by_amount(tally_p);
	if (! tally_p->sorted_by_amount) {
	    err(104, __func__, "sort_by_amount did not set sorted_by_amount to true");
	    /*NOTREACHED*/
	}
    }

    /*
     * firewall - deal with out of range amount
     */
    if (amount >= tally_p->count_alloc) {
	++tally_p->out_of_range;
	return;
    }

    /*
     * firewall - amount must match the amount in the count slot
     */
    if (amount != tally_p->count[amount].amount) {
	err(104, __func__, "missorted tally for amount: %"PRIu64" != count[%"PRIu64"].amount: %"PRIu64,
		 amount, amount, tally_p->count[amount].amount);
	/*NOTREACHED*/
    }

    /*
     * update count
     */
     if (tally_p->count[amount].count == 0) {
	 /* note that we are converting a 0 to a non-0 count */
         ++tally_p->non_zero_count;
     }
     ++tally_p->count[amount].count;
     return;
}


/*
 * v1_check - determine if a v(1) value is valid for testing h*2^n-1
 *
 * given:
 *	jstr		pointer to a Jacobi +-0 string
 *	x		the v(1) value to test
 *	cache_p		pointer to a cache that has been configurd
 *
 * returns:
 *	true	x is valid as v(1) for testing h*2^n-1
 *	false	x is NOT valid as v(1) for testing h*2^n-1
 *
 * This function calls lookup_jacobi() as needed so that the
 * Jacobi cache stats can be maintained.
 *
 * The value x is valid v(1) for testing h*2^n-1 if and only if:
 *
 *	Jacobi(x-2, h*2n-1) = 1
 *	Jacobi(x+2, h*2n-1) = -1
 *
 * NOTE: This function does not return on error.
 */
bool
v1_check(char *jstr, size_t x, cache *cache_p)
{
    /*
     * firewall
     */
    if (jstr == NULL) {
	err(105, __func__, "jstr is NULL");
	/*NOTREACHED*/
    }
    if (cache_p == NULL) {
	err(105, __func__, "cache_p is NULL");
	/*NOTREACHED*/
    }
    if (cache_p->jcache == NULL) {
	err(105, __func__, "cache_p->jcache is NULL");
	/*NOTREACHED*/
    }
    if (cache_p->jcache_use <= 0) {
	err(105, __func__, "cache_p->jcache_use <= 0, "
		 "perhaps cache was never configured");
	/*NOTREACHED*/
    }
    if (x < DEF_MIN_V1) {
	err(105, __func__, "x: %u < %d", x, DEF_MIN_V1);
	/*NOTREACHED*/
    }

    /*
     * test if Jacobi(x-2, h*2n-1) = 1
     */
    if (lookup_jacobi(jstr, x-2, cache_p) != 1) {
	/* Jacobi(x-2, h*2n-1) != 1 */
	return false;
    }

    /*
     * test if Jacobi(x+2, h*2n-1) = -1
     */
    if (lookup_jacobi(jstr, x+2, cache_p) != -1) {
	/* Jacobi(x+2, h*2n-1) != -1 */
	return false;
    }

    /*
     * x is a valid v(1) to test h*2n-1
     */
    return true;
}


/*
 * amount_cmp - compare amount values of count elements
 *
 * given:
 *	a	first object
 *	b	second object
 *
 * returns:
 *	1	a > b
 *	0	a == b
 *	-1	a < b
 */
static int
amount_cmp(const void *a_arg, const void *b_arg)
{
    count *a;	// a_arg as a count pointer
    count *b;	// b_arg as a count pointer

    /*
     * firewall - paranoia
     *
     * While this should never happen, treat NULL ptrs as if it is greater than anything else.
     * Sorting greater means LESS important to restore from.
     */
    if (a_arg == NULL && b_arg == NULL) {
        return 0;
    } else if (a_arg == NULL) {
        return 1;	// only a_arg is NULL, so a_arg is LESS important to restore (sorted later)
    } else if (b_arg == NULL) {
        return -1;	// only b_arg is NULL, so a_arg is MORE important to restore (sorted earlier)
    }
    a = (count *)a_arg;
    b = (count *)b_arg;

    /*
     * compare
     */
    if (a->amount > b->amount) {
	return 1;
    } else if (a->amount < b->amount) {
	return -1;
    } else {
	return 0;
    }
}


/*
 * count_cmp - reverse compare amount values of count elements
 *
 * given:
 *	a	first object
 *	b	second object
 *
 * returns:
 *	1	a < b
 *	0	a == b
 *	-1	a > b
 */
static int
count_cmp(const void *a_arg, const void *b_arg)
{
    count *a;	// a_arg as a count pointer
    count *b;	// b_arg as a count pointer

    /*
     * firewall - reverse paranoia
     *
     * While this should never happen, treat NULL ptrs as if it is greater than anything else.
     * Sorting greater means LESS important to restore from.
     */
    if (a_arg == NULL && b_arg == NULL) {
        return 0;
    } else if (a_arg == NULL) {
        return -1;	// only a_arg is NULL, so a_arg is LESS important to restore (sorted later)
    } else if (b_arg == NULL) {
        return 1;	// only b_arg is NULL, so a_arg is MORE important to restore (sorted earlier)
    }
    a = (count *)a_arg;
    b = (count *)b_arg;

    /*
     * reverse compare
     */
    if (a->amount > b->amount) {
	return -1;
    } else if (a->amount < b->amount) {
	return 1;
    } else {
	return 0;
    }
}


/*
 * sort_by_amount - sort count array by amount
 *
 * given:
 *	tally_p		pointer to a tally
 *
 * Sort the count array of a tally by the amount element.
 * Set the sort state.
 *
 * NOTE: This function does not return on error.
 */
void
sort_by_amount(tally *tally_p)
{
    /*
     * firewall
     */
    if (tally_p == NULL) {
	err(106, __func__, "tally_p is NULL");
	/*NOTREACHED*/
    }
    if (tally_p->count == NULL) {
	err(106, __func__, "tally_p->count is NULL");
	/*NOTREACHED*/
    }
    if (tally_p->count_alloc <= 0) {
	err(106, __func__, "tally_p->count_alloc: %"PRIu64" <= 0",
		 tally_p->count_alloc);
	/*NOTREACHED*/
    }

    /*
     * sort by amount
     */
    qsort(tally_p->count, tally_p->count_alloc, sizeof(tally_p->count[0]), amount_cmp);
    tally_p->sorted_by_amount = true;
    return;
}


/*
 * reverse_sort_by_count - reverse  sort count array by count
 *
 * given:
 *	tally_p		pointer to a tally
 *
 * Reverse sort the count array of a tally by the count element.
 * Set the sort state.
 *
 * NOTE: This function does not return on error.
 */
void
reverse_sort_by_count(tally *tally_p)
{
    /*
     * firewall
     */
    if (tally_p == NULL) {
	err(107, __func__, "tally_p is NULL");
	/*NOTREACHED*/
    }
    if (tally_p->count == NULL) {
	err(107, __func__, "tally_p->count is NULL");
	/*NOTREACHED*/
    }
    if (tally_p->count_alloc <= 0) {
	err(107, __func__, "tally_p->count_alloc: %"PRIu64" <= 0",
		 tally_p->count_alloc);
	/*NOTREACHED*/
    }

    /*
     * sort by amount
     */
    qsort(tally_p->count, tally_p->count_alloc, sizeof(tally_p->count[0]), count_cmp);
    tally_p->sorted_by_amount = false;
    return;
}
