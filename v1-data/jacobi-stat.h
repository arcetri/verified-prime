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

#if !defined(INCLUDE_JACOBI_STAT_H)
#    define INCLUDE_JACOBI_STAT_H

#include <stdbool.h>

#define DEF_MIN_V1 (3)			// maximum v(1) value allowed by the Riesel test
#define DEF_MAX_V1 (165)		// default maximum v(1) value we keep track of
#define DEF_MAX_X (DEF_MAX_V1+2)	// default maximum X value used as 1st Jaboci symbol argument
#define INVALID_JACOBI_VALUE (-2)	// not a valid value of a Jacobi symbol (valid values are: -1, 0, 1)

/*
 * count - the count and the amount - "like dialing for dollars" :-)
 *
 * We store BOTH the tally count for a value as well as the value so
 * that we can more easily reverse sort by count later on.
 */
typedef struct s_count {
    int64_t count;	// number of times the value was seen
    int64_t value;	// value being counted - "the amount"
} count;

/*
 * tally - tally count of v(1) values
 *
 * When we initialize a tally, we build a count array that is sorted by value.
 * Later, we re-sort the count array by count in reverse order.
 *
 * A tally is used to count a specific event such as the number of times v(1) is valid,
 * or the number of times a v(1) value is the first value that is valid, etc.
 *
 * The count array, when sorted_by_value is true, starts with the value of 0.
 */
typedef struct s_tally {
    int64_t count_alloc;	// >0 ==> number of count elements malloced in the count array
    int64_t non_zero_count;	// number of count elements with a non-zero count
    int64_t out_of_range;	// number of times a value to tally was outside of the tally range
    bool sorted_by_value;	// true ==> sorted by value, false ==> reverse sorted by count
    count *count;		// != NULL ==> count_alloc count elements malloced
} tally;

/*
 * cache - Jacobi symbol cache
 *
 * The Jacobi +-0 value string starts with the hard coded value for Jacobi(0, h*2^n-1) == '0'.
 * Thus, for X == 1 (i.e., Jacobi(1, h*2^n-1)), the 2nd jacobi_str character or jacobi_str[1] is used.
 *
 * The Jacobi cache array starts with the hard coded value for Jacobi(0, h*2^n-1) == 0.
 * Thus, for X == 1 (i.e., Jacobi(1, h*2^n-1)), the 2nd Jacobi cache element jcache[1] is used.
 *
 * The Jacobi cache (jcache) is initialized with the value INVALID_JACOBI_VALUE.  When referenced
 * if the Jacobi cache element == INVALID_JACOBI_VALUE, the corresponding Jacobi +-0 value string
 * element to set the Jacobi cache element as follows:
 *
 *       	'-' ==> -1
 *       	'0' ==> 0
 *       	'+' ==> 1
 *
 *	All other Jacobi string values cause INVALID_JACOBI_VALUE to be set.
 *
 * The cache_load_count + cache_hit_count + out_of_range + invalid_str_value == number of Jacobi symbol operations.
 * The cache_load_count == number of Jacobi symbol operations required with a Jacobi cache.
 */
typedef struct s_cache {
    size_t jcache_alloc;	// >0 ==> length of Jacobi symbol cache malloced/realloced in chars
    size_t jcache_use;		// >0 ==> length of Jacobi symbol cache being used in chars
    int64_t jacobi_w_cache_ops;		// number of Jacobi symbol operations using cache
    int64_t jacobi_wo_cache_ops;	// number of Jacobi symbol operations not using cache
    int64_t cache_load_count;	// number of times a Jacobi symbol operations that cause our cache to be loaded
    int64_t cache_hit_count;	// number of times a Jacobi symbol operations that hit an existing value in our cache
    int64_t out_of_range;	// number of times a value was out of range of the cache range
    int64_t invalid_str_value;	// number of times a Jacobi +-0 value string value was neither +, nor -. nor 0
    int64_t valid_v1_values;	// number of times a valid v(1) value was found
    int64_t match_prime_v1;	// valid v(1) value matches a valid 1st v(1) for a verified Riesel h*2^n-1 prime
    int64_t nomatch_prime_v1;	// valid v(1) value does NOT match any valid v(1) for a verified Riesel h*2^n-1 prime
    int8_t *jcache;		// != NULL ==> Jacobi symbol cache (-1, 0, or 1), initialized to INVALID_JACOBI_VALUE
} cache;

/*
 * external functions
 */
extern void tally_init(tally *tally_p);
extern void cache_init(cache *cache);
extern void cache_config(cache *cache_p, ssize_t len);
extern int8_t lookup_jacobi(const char *jstr, int64_t x, cache *cache_p);
extern void tally_value(tally *tally_p, int64_t value);
extern bool v1_check(const char *jstr, int64_t x, bool h_zeromod3, cache *cache_p);
extern void sort_by_value(tally *tally_p);
extern void reverse_sort_by_count(tally *tally_p);
extern void write_stats(tally *tally_p, cache *cache_p, FILE *stream);

#endif	/* INCLUDE_JACOBI_STAT_H */
