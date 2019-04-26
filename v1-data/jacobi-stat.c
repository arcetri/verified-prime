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
static bool match_prime_v1(int64_t v1, bool h_zeromod3);
static int reverse_count_cmp(const void *a_arg, const void *b_arg);
static int value_cmp(const void *a_arg, const void *b_arg);
static int ave_jop_cmp(const void *a_arg, const void *b_arg);
static void sort_by_jop(ave_jop *ave_jop_p);

/*
 * The array:
 *
 * 	best_v1_verified_prime[]
 *
 * came from job.h-0mod3.prime-large tally files using the best_array.sh script:
 *
 * 	./print_best_array.sh -p job.h-0mod3.prime-all
 *
 * NOTE: The best_v1_verified_prime list comes from the 1st valid (1)
 *       for verified primes > 999 and h=0mod3:
 *
 *	https://github.com/arcetri/verified-prime/blob/master/h-0mod3-n.verified-prime.txt
 *
 * where h*2^n-1 > 1001 and h=0mod3
 *
 * NOTE: The > 1001 comes from DEF_MAX_X, which is usally 999+2
 *
 * NOTE The -1 value indicates end of list and is not part of the true list.
 */

// ./print_best_array.sh -p job.h-0mod3.prime-all

/* 1st v(1) from large verified primes > 999 and h=0mod3 rev sorted by freq */
/*     NOTE: array values are from job.h-0mod3.prime-all/tally.1stint */
const int64_t best_v1_verified_prime[] = {
    3, 5, 9, 11, 15, 17, 21, 27, 29, 35, 39, 41, 45, 51, 57, 59,
    65, 69, 81,
    -1	// must be the last value
};
// largest value found in best_v1_verified_prime[]
const int64_t largest_odd_v1_verified_prime = 81;

/*
 * counter_init - initialize stats counters
 *
 * given:
 *	stats_p		pointer to stats structure
 *
 * NOTE: This function does not return on error.
 */
void
counter_init(stats *stats_p)
{
    /*
     * firewall
     */
    if (stats_p == NULL) {
	err(100, __func__, "stats_p is NULL");
	/*NOTREACHED*/
    }

    /*
     * zeroize v(1) counters
     */
    memset(&stats_p->found, 0, sizeof(stats_p->found));
    memset(&stats_p->missed, 0, sizeof(stats_p->missed));

    /*
     * initialize with_cache values
     */
    stats_p->with_cache[E_tally_int].jop_label = LABEL_tally_int;
    stats_p->with_cache[E_tally_int].jop = 0.0;
    stats_p->with_cache[E_tally_int].order = E_tally_int;
    /**/
    stats_p->with_cache[E_tally_1stint].jop_label = LABEL_tally_1stint;
    stats_p->with_cache[E_tally_1stint].jop = 0.0;
    stats_p->with_cache[E_tally_1stint].order = E_tally_1stint;
    /**/
    stats_p->with_cache[E_tally_odd].jop_label = LABEL_tally_odd;
    stats_p->with_cache[E_tally_odd].jop = 0.0;
    stats_p->with_cache[E_tally_odd].order = E_tally_odd;
    /**/
    stats_p->with_cache[E_tally_1stodd].jop_label = LABEL_tally_1stodd;
    stats_p->with_cache[E_tally_1stodd].jop = 0.0;
    stats_p->with_cache[E_tally_1stodd].order = E_tally_1stodd;
    /**/
    stats_p->with_cache[E_tally_freq].jop_label = LABEL_tally_freq;
    stats_p->with_cache[E_tally_freq].jop = 0.0;
    stats_p->with_cache[E_tally_freq].order = E_tally_freq;
    /**/
    stats_p->with_cache[E_tally_v1].jop_label = LABEL_tally_v1;
    stats_p->with_cache[E_tally_v1].jop = 0.0;
    stats_p->with_cache[E_tally_v1].order = E_tally_v1;
    /**/
    stats_p->with_cache[E_tally_oddfreq].jop_label = LABEL_tally_oddfreq;
    stats_p->with_cache[E_tally_oddfreq].jop = 0.0;
    stats_p->with_cache[E_tally_oddfreq].order = E_tally_oddfreq;
    /**/
    stats_p->with_cache[E_tally_oddv1].jop_label = LABEL_tally_oddv1;
    stats_p->with_cache[E_tally_oddv1].jop = 0.0;
    stats_p->with_cache[E_tally_oddv1].order = E_tally_oddv1;
    /**/
    stats_p->with_cache[E_tally_prime].jop_label = LABEL_tally_prime;
    stats_p->with_cache[E_tally_prime].jop = 0.0;
    stats_p->with_cache[E_tally_prime].order = E_tally_prime;

    /*
     * initialize without_cache values
     */
    stats_p->without_cache[E_tally_int].jop_label = LABEL_tally_int;
    stats_p->without_cache[E_tally_int].jop = 0.0;
    stats_p->without_cache[E_tally_1stint].jop_label = LABEL_tally_1stint;
    stats_p->without_cache[E_tally_1stint].jop = 0.0;
    stats_p->without_cache[E_tally_odd].jop_label = LABEL_tally_odd;
    stats_p->without_cache[E_tally_odd].jop = 0.0;
    stats_p->without_cache[E_tally_1stodd].jop_label = LABEL_tally_1stodd;
    stats_p->without_cache[E_tally_1stodd].jop = 0.0;
    stats_p->without_cache[E_tally_freq].jop_label = LABEL_tally_freq;
    stats_p->without_cache[E_tally_freq].jop = 0.0;
    stats_p->without_cache[E_tally_v1].jop_label = LABEL_tally_v1;
    stats_p->without_cache[E_tally_v1].jop = 0.0;
    stats_p->without_cache[E_tally_oddfreq].jop_label = LABEL_tally_oddfreq;
    stats_p->without_cache[E_tally_oddfreq].jop = 0.0;
    stats_p->without_cache[E_tally_oddv1].jop_label = LABEL_tally_oddv1;
    stats_p->without_cache[E_tally_oddv1].jop = 0.0;
    stats_p->without_cache[E_tally_prime].jop_label = LABEL_tally_prime;
    stats_p->without_cache[E_tally_prime].jop = 0.0;

    /*
     * zero the zero skip count
     */
    stats_p->not_skip = 0;
    stats_p->zero_skip = 0;
    return;
}

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
     * Because the count array, when sorted_by_value is true, starts with the value of 0.
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
    /* setup pre-sorted by value */
    for (i=0; i < tally_p->count_alloc; ++i) {
	tally_p->count[i].count = 0;
	tally_p->count[i].value = i;
    }

    /*
     * clear tally stats
     */
    tally_p->non_zero_count = 0;
    tally_p->out_of_range = 0;
    tally_p->sorted_by_value = true;
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
    cache_p->jacobi_w_cache_ops = 0;
    cache_p->jacobi_wo_cache_ops = 0;
    cache_p->cache_load_count = 0;
    cache_p->cache_hit_count = 0;
    cache_p->out_of_range = 0;
    cache_p->invalid_str_value = 0;
    cache_p->valid_v1_values = 0;
    cache_p->match_prime_v1 = 0;
    cache_p->nomatch_prime_v1 = 0;
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
     * configure the cache size
     */
    cache_p->jcache_use = (size_t) len;
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
lookup_jacobi(const char *jstr, int64_t x, cache *cache_p)
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
     * count this Jacobi operation as if we are not using a cache
     */
    ++cache_p->jacobi_wo_cache_ops;

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
     ++cache_p->jacobi_w_cache_ops;	// missed our cache, note a Jacobi evaluation
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
 *	value		the value to tally
 *
 * NOTE: This function does not return on error.
 */
void
tally_value(tally *tally_p, int64_t value)
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
     * be sure the tally is sorted by value
     */
    if (! tally_p->sorted_by_value) {
	reverse_sort_by_count(tally_p);
	if (! tally_p->sorted_by_value) {
	    err(104, __func__, "reverse_sort_by_count did not set sorted_by_value to false");
	    /*NOTREACHED*/
	}
    }

    /*
     * firewall - deal with out of range value
     */
    if (value >= tally_p->count_alloc) {
	++tally_p->out_of_range;
	return;
    }

    /*
     * firewall - value must match the value in the count slot
     */
    if (value != tally_p->count[value].value) {
	err(104, __func__, "missorted tally for value: %"PRIu64" != count[%"PRIu64"].value: %"PRIu64,
		 value, value, tally_p->count[value].value);
	/*NOTREACHED*/
    }

    /*
     * update count
     */
     if (tally_p->count[value].count == 0) {
	 /* note that we are converting a 0 to a non-0 count */
         ++tally_p->non_zero_count;
     }
     ++tally_p->count[value].count;
     return;
}


/*
 * match_prime_v1 - v(1) value matches a valid 1st v(1) for a verified Riesel h*2^n-1 prime
 *
 * given:
 *	v1		valid v(1) value
 *	h_zeromod3	true ==> h == 0 mod 3, falase otherwise
 *
 * retuns:
 *	true		valid v(1) value matches a valid 1st v(1) for a verified Riesel h*2^n-1 prime
 *	false		valid v(1) value does NOT match any valid v(1) for a verified Riesel h*2^n-1 prime
 */
static bool
match_prime_v1(int64_t v1, bool h_zeromod3)
{
    int64_t verified_prime_1st_v1;	// valid 1st v(1) for a verified Riesel h*2^n-1 prime
    int i;

    /*
     * case: h != 0 mod 3
     *
     * When h != 0 mod 3, the 1st valid v(1) value is 3 40% of the time, and 4 60% of the time.
     * This goes for both verified primes and non-verified primes.
     *
     * In particular, when h != 0 mod 3 we should always return true
     */
    if (h_zeromod3) {

	/*
	 * case: h == 0 mod 3
	 */
	for (i=0; best_v1_verified_prime[i] > 0; ++i) {
	    verified_prime_1st_v1 = best_v1_verified_prime[i];
	    if (v1 == verified_prime_1st_v1) {
		return true;	// matches a valid 1st v(1) for a verified Riesel h*2^n-1 prime
	    }
	}

    } else {
	return true;	// matches a valid 1st v(1) for a verified Riesel h*2^n-1 prime
    }
    return false;	// does NOT match any valid v(1) for a verified Riesel h*2^n-1 prime
}


/*
 * v1_check - determine if a v(1) value is valid for testing h*2^n-1
 *
 * given:
 *	jstr		pointer to a Jacobi +-0 string
 *	x		the v(1) value to test
 *	h_zeromod3	true ==> h == 0 mod 3, falase otherwise
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
v1_check(const char *jstr, int64_t x, bool h_zeromod3, cache *cache_p)
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
     * determine if this valid v(1) matches a valid 1st v(1) for a verified Riesel h*2^n-1 prime
     */
    if (match_prime_v1(x, h_zeromod3)) {
	++cache_p->match_prime_v1;	// matches a valid 1st v(1) for a verified Riesel h*2^n-1 prime
    } else {
	++cache_p->nomatch_prime_v1;	// does NOT match any valid v(1) for a verified Riesel h*2^n-1 prime
    }

    /*
     * x is a valid v(1) to test h*2n-1
     */
    ++cache_p->valid_v1_values;	// count this valid v(1) value
    return true;
}


/*
 * reverse_count_cmp - reverse compare count values
 *
 * given:
 *	a	first object
 *	b	second object
 *
 * returns:
 *	-1	a > b
 *	0	a == b
 *	1	a < b
 */
static int
reverse_count_cmp(const void *a_arg, const void *b_arg)
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
        return -1;	// only a_arg is NULL, so a_arg is LESS important to restore (sorted later)
    } else if (b_arg == NULL) {
        return 1;	// only b_arg is NULL, so a_arg is MORE important to restore (sorted earlier)
    }
    a = (count *)a_arg;
    b = (count *)b_arg;

    /*
     * compare
     */
    if (a->count > b->count) {
	return -1;	// reverse count order
    } else if (a->count < b->count) {
	return 1;	// reverse count order
    } else if (a->value > b->value) {
	return 1;	// forward value order when counts match
    } else if (a->value < b->value) {
	return -1;	// forward value order when counts match
    } else {
	return 0;
    }
}


/*
 * value_cmp - compare values
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
value_cmp(const void *a_arg, const void *b_arg)
{
    count *a;	// a_arg as a count pointer
    count *b;	// b_arg as a count pointer

    /*
     * firewall - forward paranoia
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
     * forward compare
     */
    if (a->value > b->value) {
	return 1;	// forward value order
    } else if (a->value < b->value) {
	return -1;	// forward value order
    } else if (a->count > b->count) {
	return 1;	// forward count order when values match
    } else if (a->count < b->count) {
	return -1;	// forward count order when values match
    } else {
	return 0;
    }
}


/*
 * ave_jop_cmp - compare ave_jop.jop values
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
ave_jop_cmp(const void *a_arg, const void *b_arg)
{
    ave_jop *a;	// a_arg as a jop_cmp pointer
    ave_jop *b;	// b_arg as a jop_cmp pointer
    double a_jop;	// a->jop rounded to 3 digits
    double b_jop;	// b->jop rounded to 3 digits

    /*
     * firewall - forward paranoia
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
    a = (ave_jop *)a_arg;
    b = (ave_jop *)b_arg;

    /*
     * round to 3 digits
     */
    a_jop = (double)((int)((a->jop * 1000.0) + 0.5)) / 1000.0;
    b_jop = (double)((int)((b->jop * 1000.0) + 0.5)) / 1000.0;

    /*
     * forward compare
     */
    if (a_jop > b_jop) {
	return 1;	// forward value order
    } else if (a_jop < b_jop) {
	return -1;	// forward value order
    } else if (a->order > b->order) {
	return -1;	// reverse value order
    } else if (a->order < b->order) {
	return 1;	// reverse value order
    } else {
	return 0;
    }
}


/*
 * sort_by_value - sort count array by value
 *
 * given:
 *	tally_p		pointer to a tally
 *
 * Sort the count array of a tally by the count element.
 * Set the sort state.
 *
 * NOTE: This function does not return on error.
 */
void
sort_by_value(tally *tally_p)
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
     * sort by value
     */
    if (tally_p->sorted_by_value) {
	dbg(DBG_LOW, "already sorted count array by value");
	return;	// nothing more to do - already sorted
    }
    qsort(tally_p->count, tally_p->count_alloc, sizeof(tally_p->count[0]), value_cmp);
    tally_p->sorted_by_value = true;
    return;
}


/*
 * reverse_sort_by_count - reverse sort by count
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
     * reverse sort by count
     */
    if (! tally_p->sorted_by_value) {
	dbg(DBG_LOW, "already reverse sorted count array by value");
	return;	// nothing more to do - already sorted
    }
    qsort(tally_p->count, tally_p->count_alloc, sizeof(tally_p->count[0]), reverse_count_cmp);
    tally_p->sorted_by_value = false;
    return;
}


/*
 * sort_by_jop - sort ave_jop array by jop
 *
 * given:
 *	ave_jop_p	pointer to a ave_jop
 *
 * Sort the ave_jop array of a tally by the jop element.
 * Set the sort state.
 *
 * NOTE: This function does not return on error.
 */
static void
sort_by_jop(ave_jop *ave_jop_p)
{
    /*
     * firewall
     */
    if (ave_jop_p == NULL) {
	err(106, __func__, "ave_jop_p is NULL");
	/*NOTREACHED*/
    }

    /*
     * sort by job
     */
    qsort(ave_jop_p, E_TALLY_BEYOND, sizeof(ave_jop_p[0]), ave_jop_cmp);
    return;
}


/*
 * write_stats - write tally and cache information to an open stream
 *
 * given:
 *	tally_p			pointer to a tally
 *	cache_p			pointer to a cache
 *	ave_ops_cache_p		pointer to average Jacobi ops with a Jacobi cache
 *	ave_ops_no_cache_p	pointer to average Jacobi ops w/o a Jacobi cache
 *	filename		name of the opened file
 *	stream			stream open for writing
 *
 * NOTE: This function does not return on error.
 */
void
write_stats(tally *tally_p, cache *cache_p, double *ave_ops_cache_p,
	    double *ave_ops_no_cache_p, const char *filename, FILE *stream)
{
    double fraction_prime;	// fraction of 1st valid v(1) matching 1st v(1) of a verified prime
    int64_t count_sum;	// sum of all counts
    int64_t i;

    /*
     * firewall
     */
    if (tally_p == NULL) {
	err(109, __func__, "tally_p is NULL");
	/*NOTREACHED*/
    }
    if (tally_p->count == NULL) {
	err(109, __func__, "tally_p->count is NULL");
	/*NOTREACHED*/
    }
    if (tally_p->count_alloc <= 0) {
	err(109, __func__, "tally_p->count_alloc: %"PRIu64" <= 0",
		 tally_p->count_alloc);
	/*NOTREACHED*/
    }
    if (ave_ops_cache_p == NULL) {
	err(109, __func__, "ave_ops_cache_p is NULL");
	/*NOTREACHED*/
    }
    if (ave_ops_no_cache_p == NULL) {
	err(109, __func__, "ave_ops_no_cache_p is NULL");
	/*NOTREACHED*/
    }
    if (filename == NULL) {
	err(109, __func__, "filename is NULL");
	/*NOTREACHED*/
    }
    if (stream == NULL) {
	err(109, __func__, "stream is NULL");
	/*NOTREACHED*/
    }
    if (cache_p == NULL) {
	err(108, __func__, "cache_p is NULL");
	/*NOTREACHED*/
    }
    if (cache_p->jcache == NULL) {
	err(108, __func__, "cache_p->jcache is NULL");
	/*NOTREACHED*/
    }

    /*
     * compute tally count sum
     */
    count_sum = 0;
    for (i=0; i < tally_p->count_alloc; ++i) {
	count_sum += tally_p->count[i].count;
    }
    count_sum += tally_p->out_of_range;

    /*
     * determine average Jacobi ops and fraction of fraction verified prime
     */
    if (cache_p->valid_v1_values == 0) {
	*ave_ops_cache_p = (double)0.0;
	*ave_ops_no_cache_p = (double)0.0;
    } else {
	*ave_ops_cache_p = (double)cache_p->jacobi_w_cache_ops / (double)cache_p->valid_v1_values;
	*ave_ops_no_cache_p = (double)cache_p->jacobi_wo_cache_ops / (double)cache_p->valid_v1_values;
    }
    if ((cache_p->match_prime_v1 + cache_p->nomatch_prime_v1) == 0) {
	fraction_prime = (double)0.0;
    } else {
	fraction_prime = (double)cache_p->match_prime_v1 /
			 (double)(cache_p->match_prime_v1 + cache_p->nomatch_prime_v1);
    }

    /*
     * write cache information header
     */
    fprintf(stream, "# filename = %s\n", filename);
    fprintf(stream, "#\n");
    fprintf(stream, "# ave jacobi ops per valid v(1) with cache = %.4f\n", *ave_ops_cache_p);
    fprintf(stream, "# ave jacobi ops per valid v(1) w/o cache  = %.4f\n", *ave_ops_no_cache_p);
    fprintf(stream, "#\n");
    fprintf(stream, "# fraction of 1st valid v(1) matching 1st v(1) of a verified prime = %.4f\n",
		    fraction_prime);
    fprintf(stream, "#\n");
    fprintf(stream, "# match_prime_v1        = %"PRIu64"\n", cache_p->match_prime_v1);
    fprintf(stream, "# nomatch_prime_v1      = %"PRIu64"\n", cache_p->nomatch_prime_v1);
    fprintf(stream, "#\n");
    fprintf(stream, "# Jacobi ops ignoring cache = %"PRIu64"\n", cache_p->jacobi_w_cache_ops);
    fprintf(stream, "# Jacobi ops with cache     = %"PRIu64"\n", cache_p->jacobi_wo_cache_ops);
    fprintf(stream, "# valid_v1_values           = %"PRIu64"\n", cache_p->valid_v1_values);
    fprintf(stream, "#\n");
    fprintf(stream, "# cache_load_count  = %"PRIu64"\n", cache_p->cache_load_count);
    fprintf(stream, "# cache_hit_count   = %"PRIu64"\n", cache_p->cache_hit_count);
    fprintf(stream, "#\n");
    fprintf(stream, "# out_of_range      = %"PRIu64"\n", cache_p->out_of_range);
    fprintf(stream, "# invalid_str_value = %"PRIu64"\n", cache_p->invalid_str_value);
    fprintf(stream, "#\n");

    /*
     * write tally information header
     */
    fprintf(stream, "# non_zero_count = %"PRIu64"\n", tally_p->non_zero_count);
    fprintf(stream, "# zero_count     = %"PRIu64"\n", tally_p->count_alloc - tally_p->non_zero_count);
    fprintf(stream, "# out_of_range   = %"PRIu64"\n", tally_p->out_of_range);
    fprintf(stream, "#\n");
    fprintf(stream, "# count sum = %"PRIu64"\n", count_sum);
    fprintf(stream, "#\n");
    fprintf(stream, "# count value\n");

    /*
     * write each count element
     */
    for (i=0; i < tally_p->count_alloc; ++i) {
	fprintf(stream, "%"PRIu64" %"PRIu64"\n",
		tally_p->count[i].count,
		tally_p->count[i].value);
    }
    return;
}


/*
 * write global stats - write global stats
 *
 * given:
 *	stats_p		pointer to stats structure
 *	stream		stream open for writing
 */
void
write_global_stats(stats *stats_p, FILE *stream)
{
    ave_jop ave_sorted[E_TALLY_BEYOND];	// sorted with_cache or without_cache
    int i;

    /*
     * firewall
     */
    if (stream == NULL) {
	err(109, __func__, "stream open for writing is NULL");
	/*NOTREACHED*/
    }
    if (stream == NULL) {
	err(109, __func__, "stream is NULL");
	/*NOTREACHED*/
    }

    /*
     * write average number of Jacobi ops with cache stats
     */
    fprintf(stream, "Average number of Jacobi operations with Jacobi cache, sorted from best to worst\n");
    memcpy(ave_sorted, stats_p->with_cache, sizeof(ave_sorted[0]) * E_TALLY_BEYOND);
    sort_by_jop(ave_sorted);
    for (i=0; i < E_TALLY_BEYOND; ++i) {
	char *label = ave_sorted[i].jop_label;	// label to print if not NULL

	/*
	 * firewall
	 */
	if (label == NULL) {
	    label = "((NULL label))";
	}

	/*
	 * write label and average number of Jacobi ops
	 */
	fprintf(stream, "    %7.3f  =#%d-with-cache->  %s\n", ave_sorted[i].jop, i+1, label);
    }
    fputc('\n', stream);

    /*
     * write average number of Jacobi ops without cache stats
     */
    fprintf(stream, "Average number of Jacobi operations without Jacobi cache, sorted from best to worst\n");
    memcpy(ave_sorted, stats_p->without_cache, sizeof(ave_sorted[0]) * E_TALLY_BEYOND);
    sort_by_jop(ave_sorted);
    for (i=0; i < E_TALLY_BEYOND; ++i) {
	char *label = ave_sorted[i].jop_label;	// label to print if not NULL

	/*
	 * firewall
	 */
	if (label == NULL) {
	    label = "((NULL label))";
	}

	/*
	 * write label and average number of Jacobi ops
	 */
	fprintf(stream, "    %7.3f  =#%d-w/o-cache->  %s\n", ave_sorted[i].jop, i+1, label);
    }
    fputc('\n', stream);

    /*
     * write found and missed stats
     */
    fprintf(stream, "valid v(1) in integer search\n");
    fprintf(stream, "    found = %"PRId64"\n", stats_p->found.valid_v1);
    fprintf(stream, "    missed = %"PRId64"\n", stats_p->missed.valid_v1);
    fputc('\n', stream);
    fprintf(stream, "valid v(1) in odd search\n");
    fprintf(stream, "    found  = %"PRId64"\n", stats_p->found.valid_odd_v1);
    fprintf(stream, "    missed = %"PRId64"\n", stats_p->missed.valid_odd_v1);
    fputc('\n', stream);
    fprintf(stream, "common 1st valid v(1) h0mod3 - reverse sorted by freq of use\n");
    fprintf(stream, "    found  = %"PRId64"\n", stats_p->found.best_by_freq);
    fprintf(stream, "    missed = %"PRId64"\n", stats_p->missed.best_by_freq);
    fputc('\n', stream);
    fprintf(stream, "common 1st valid v(1) h0mod3 - sorted by v(1)\n");
    fprintf(stream, "    found  = %"PRId64"\n", stats_p->found.best_by_v1);
    fprintf(stream, "    missed = %"PRId64"\n", stats_p->missed.best_by_v1);
    fputc('\n', stream);
    fprintf(stream, "common 1st valid odd v(1) h0mod3 - reverse sorted by freq of use\n");
    fprintf(stream, "    found  = %"PRId64"\n", stats_p->found.best_by_oddfreq);
    fprintf(stream, "    missed = %"PRId64"\n", stats_p->missed.best_by_oddfreq);
    fputc('\n', stream);
    fprintf(stream, "common 1st valid odd v(1) h0mod3 - sorted by v(1)\n");
    fprintf(stream, "    found  = %"PRId64"\n", stats_p->found.best_by_oddv1);
    fprintf(stream, "    missed = %"PRId64"\n", stats_p->missed.best_by_oddv1);
    fputc('\n', stream);
    fprintf(stream, "1st valid v(1) from verified primes with h=0mod3, n>=1000\n");
    fprintf(stream, "    found  = %"PRId64"\n", stats_p->found.best_prime);
    fprintf(stream, "    missed = %"PRId64"\n", stats_p->missed.best_prime);
    fputc('\n', stream);
    fprintf(stream, "h n pairs skipped due to finding some Jacobi(X, h*2^n-1) == 0\n");
    fprintf(stream, "    no-zero = %"PRId64"\n", stats_p->not_skip);
    fprintf(stream, "    skipped = %"PRId64"\n", stats_p->zero_skip);
    return;
}
