/*
 * jacobi-stat - Keep track of Jacobi +- or 0 v(1) stats
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
/*
 * IMPORTANT:
 *
 * The DEF_MAX_V1 definition below needs to match the DEF_MAX_V1 shall variable in these scripts:
 *
 *	gen.job.sh
 *	gen.prime-all.sh
 *	gen.prime-large.sh
 *	gen.prime-small.sh
 *	form.slurm.sh
 *
 * in order to avoid false invalid_str_value events.  The DEF_MAX_V1 shell variable
 * in those scripts is used to prevent the shell variable, MAX, from exceeding the
 * DEF_MAX_V1 definition below.  If the MAX shell variable were to exceed the
 * DEF_MAX_V1 definition below, then any charactes used on a Jacobi +- or 0 value string
 * that exceeded the DEF_MAX_V1 position would be incorrectly counted as an
 * invalid_str_value event.
 */
#define DEF_MAX_V1 (999)		// default maximum v(1) value we keep track of
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
 * The Jacobi +- value string starts with the hard coded value for Jacobi(0, h*2^n-1) == '*'.
 * Thus, for X == 1 (i.e., Jacobi(1, h*2^n-1)), the 2nd jacobi_str character or jacobi_str[1] is used.
 * The value jacobi_str[0] is NOT used.
 *
 * The Jacobi cache array starts with the hard coded value for Jacobi(0, h*2^n-1) == INVALID_JACOBI_VALUE.
 * Thus, for X == 1 (i.e., Jacobi(1, h*2^n-1)), the 2nd Jacobi cache element jcache[1] is used.
 * The value jcache[0] is NOT used.
 *
 * The Jacobi cache (jcache) is initialized with the value INVALID_JACOBI_VALUE.  When referenced
 * if the Jacobi cache element == INVALID_JACOBI_VALUE, the corresponding Jacobi +- string
 * element to set the Jacobi cache element as follows:
 *
 *       	'-' ==> -1
 *       	'+' ==> 1
 *
 *	All other Jacobi string values cause INVALID_JACOBI_VALUE to be set.
 *
 * NOTE: Jacobi +- strings that start with 0 indicate that h*2^n-1 is not prime or too small
 * 	 to be worth testing for primality.
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
    int64_t invalid_str_value;	// number of times a Jacobi +- value string value was neither +, nor -. nor 0
				// See also the above comment about DEF_MAX_V1
    int64_t valid_v1_values;	// number of times a valid v(1) value was found
    int64_t match_prime_v1;	// valid v(1) value matches a valid 1st v(1) for a verified Riesel h*2^n-1 prime
    int64_t nomatch_prime_v1;	// valid v(1) value does NOT match any valid v(1) for a verified Riesel h*2^n-1 prime
    int8_t *jcache;		// != NULL ==> Jacobi symbol cache (-1, 0, or 1), initialized to INVALID_JACOBI_VALUE
} cache;

/*
 * v1_count - v(1) counters
 */
typedef struct s_v1_count {
    int64_t valid_v1;		// count of found or missed a valid v(1) in integer search
    int64_t valid_odd_v1;	// count of found or missed a valid v(1) in odd search
    int64_t best_by_freq;	// count of found or missed a common 1st valid v(1) h0mod3 - reverse sorted by freq of use
    int64_t best_by_v1;		// count of found or missed a common 1st valid v(1) h0mod3 - sorted by v(1)
    int64_t best_by_oddfreq;	// count of found or missed a common 1st valid odd v(1) h0mod3 - reverse sorted by freq of use
    int64_t best_by_oddv1;	// count of found or missed a common 1st valid odd v(1) h0mod3 - sorted by v(1)
    int64_t best_prime;		// count of found or missed a 1st valid v(1) from verified primes > 1001 and h=0mod3
} v1_count;

#define LABEL_tally_int "valid v(1) for consecutive integers"
#define LABEL_tally_1stint "smallest valid v(1) for consecutive integers"
#define LABEL_tally_odd "valid odd v(1) for consecutive odd integers"
#define LABEL_tally_1stodd "smallest valid odd v(1) for consecutive odd integers"
#define LABEL_tally_freq "common 1st valid v(1) h0mod3 - reverse sorted by freq of use"
#define LABEL_tally_v1 "common 1st valid v(1) h0mod3 - sorted by v(1)"
#define LABEL_tally_oddfreq "common 1st valid odd v(1) h0mod3 - reverse sorted by freq of use"
#define LABEL_tally_oddv1 "common 1st valid odd v(1) h0mod3 - sorted by v(1)"
#define LABEL_tally_prime "1st valid v(1) from verified primes > 1001 and h=0mod3"

/*
 * e_tally - enumerate ave_jop array
 */
enum e_tally {
    E_tally_int = 0,
    E_tally_1stint,
    E_tally_odd,
    E_tally_1stodd,
    E_tally_freq,
    E_tally_v1,
    E_tally_oddfreq,
    E_tally_oddv1,
    E_tally_prime,
    E_TALLY_BEYOND,
};

/*
 * ave_jops - average number of Jacobi operations
 */
typedef struct s_ave_jop {
    char *jop_label;		// pointer to a Jacobi operations average label
    double jop;			// average number of Jacobi operations
    enum e_tally order;		// ave_jop order
} ave_jop;

/*
 * stats - overall test stats
 */
typedef struct s_stats {
    v1_count found;		// count of when we found a valid v(1) under a given situation
    v1_count missed;		// count of when we missed a valid v(1) under a given situation
    ave_jop with_cache[E_TALLY_BEYOND];	// average number of Jacobi ops for various situations with Jacobi cache
    ave_jop without_cache[E_TALLY_BEYOND];	// average number of Jacobi ops for various situations with Jacobi cache
    int64_t not_skip;		// did not skip h and n as no Jacobi(X, h*2^n-1) == 0 was found
    int64_t zero_skip;		// h*2^n-1 is not prime, or too small to test: Jacobi(X, h*2^n-1) == 0 was found
} stats;

/*
 * external variables
 */
extern const int64_t best_v1_verified_prime[];
extern const int64_t largest_odd_v1_verified_prime;

/*
 * external functions
 */
extern void counter_init(stats *stats_p);
extern void tally_init(tally *tally_p);
extern void cache_init(cache *cache);
extern void cache_config(cache *cache_p, ssize_t len);
extern int8_t lookup_jacobi(const char *jstr, int64_t x, cache *cache_p);
extern void tally_value(tally *tally_p, int64_t value);
extern bool v1_check(const char *jstr, int64_t x, bool h_zeromod3, cache *cache_p);
extern void sort_by_value(tally *tally_p);
extern void reverse_sort_by_count(tally *tally_p);
extern void write_stats(tally *tally_p, cache *cache_p,
	    double *ave_ops_cache_p, double *ave_ops_no_cache_p,
	    const char *filename, FILE *stream);
extern void write_global_stats(stats *stats_p, FILE *stream);

#endif	/* INCLUDE_JACOBI_STAT_H */
