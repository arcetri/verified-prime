/*
 * jacobi-gentally - Generate tally analysis files for Jacobi v(1) analysis
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

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <inttypes.h>
#include <getopt.h>

#include "debug.h"
#include "jacobi-parse.h"
#include "jacobi-stat.h"

/*
 * usage
 */
const char * usage =
"usage: %s [-h] [-v lvl] global.stats tally.int tally.1stint tally.odd\n"
"				    tally.1stodd tally.byfreq tally.byv1\n"
"				    tally.byoddfreq tally.byoddv1 tally.prime\n"
"\n"
"	-h		print usage message and exit\n"
"	-v lvl		set debugging level (def: 0 ==> none)\n"
"\n"
"	global.stats	global statistics for this run\n"
"	tally.int	tally of valid v(1) for consecutive integers\n"
"	tally.1stint	tally of smallest valid v(1) for consecutive integers\n"
"	tally.odd	tally of valid odd v(1) for consecutive odd integers\n"
"	tally.1stodd	tally of smallest valid odd v(1) for consecutive odd integers\n"
"	tally.byfreq	tally of common for 0mod3 case reverse sorted by frequency of use\n"
"	tally.byv1	tally of common for 0mod3 case sorted by v(1)\n"
"	tally.byoddfreq	tally of common odd for 0mod3 case reverse sorted by frequency of use\n"
"	tally.byoddv1	tally of common odd for 0mod3 case sorted by v(1)\n"
"	tally.prime	tally of 1st valid v(1) from verified primes with h=0mod3, n>=1000"
;

/* external variables */
const char *program = NULL;		// our name
const char version_string[] = "jacobi-gentally 1.0";  // our package name and version
int debuglevel = DBG_NONE;		// print debug messages <= debuglevel
bool use_syslog = false;		// true ==> use syslog services msgs

/*
 * recommended v(1) search list
 *
 * Below are the counts associated with non-zero values from
 * all jobs run under:
 *
 *	baseline/job.h-0mod3.n-4194304/tally.1stint
 *	baseline/job.h-0mod3.n-4331116/tally.1stint
 *	baseline/job.h-0mod3.n-4885002/tally.1stint
 *	baseline/job.h-0mod3.n-5209020/tally.1stint
 *	baseline/job.h-0mod3.n-6286862/tally.1stint
 *	baseline/job.h-0mod3.n-7676777/tally.1stint
 *	baseline/job.h-0mod3.n-8388608/tally.1stint
 *
 * The best_v1_reverse_sorted_by_v1[] is sorted by valid v(1) value.
 * For best_v1_reverse_sorted_by_v1[] (expect the for formatting and final -1) use:
 *
 *	cat job.h-0mod3.baseline/tally.1stint |
 *	    sed -e '/^#/d' -e '/^0 /d' | fld 2 |
 *	    sort -n |
 *	    tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
 *
 * The best_v1_reverse_sorted_by_oddv1[] is odd sorted by valid v(1) value.
 * For best_v1_reverse_sorted_by_oddv1[] (expect the for formatting and final -1) use:
 *
 *	cat job.h-0mod3.baseline/tally.1stodd |
 *	    sed -e '/^#/d' -e '/^0 /d' | fld 2 |
 *	    sort -n |
 *	    tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
 *
 * The best_v1_reverse_sorted_by_freq[] is sorted in reverse order by count.
 * For best_v1_reverse_sorted_by_freq[] (expect the for formatting and final -1) use:
 *
 *	cat job.h-0mod3.baseline/tally.1stint |
 *	    sed -e '/^#/d' -e '/^0 /d' | fld 2 |
 *	    tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
 *
 * The best_v1_reverse_sorted_by_oddfreq[] is odd sorted in reverse order by count.
 * For best_v1_reverse_sorted_by_oddfreq[] (expect the for formatting and final -1) use:
 *
 *	cat job.h-0mod3.baseline/tally.1stodd |
 *	    sed -e '/^#/d' -e '/^0 /d' | fld 2 |
 *	    tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
 *
 * The best_v1_verified_prime[] is sorted in reverse order by count.
 * For best_v1_verified_prime[] (expect the for formatting and final -2) use:
 *
 *	cat job.h-0mod3.prime-large/tally.1stint |
 *	    sed -e '/^#/d' -e '/^0 /d' | fld 2 |
 *	    tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
 *
 * NOTE: The best_v1_verified_prime list comes from the 1at valid (1) for large verified primes:
 *
 *	https://github.com/arcetri/verified-prime/blob/master/h-0mod3-n.verified-prime-large.txt
 *
 * where n >= 1000 and h = 0 mod 3.
 *
 * NOTE The -1 value indicates end of list and is not part of the true list.
 */

/* Known 1st v(1) sorted by v(1) */
static int64_t best_v1_reverse_sorted_by_v1[] = {
    3, 5, 9, 11, 15, 17, 20, 21, 27, 29, 32, 35, 36, 39, 41, 44, 45,
    49, 51, 55, 56, 57, 59, 65, 66, 67, 69, 71, 72, 74, 77, 80, 81, 84,
    87, 90, 95, 99, 101, 104, 105, 109, 111, 116, 125, 135,
    -1	// must be the last value
};

/* Odd Known 1st v(1) sorted by v(1) */
static int64_t best_v1_reverse_sorted_by_oddv1[] = {
    3, 5, 9, 11, 15, 17, 21, 27, 29, 31, 35, 39, 41, 45, 49, 51, 53,
    55, 57, 59, 65, 67, 69, 71, 77, 81, 83, 85, 87, 95, 99, 101, 105,
    107, 109, 111, 125, 129, 135, 139, 141, 149, 155, 165,
    -1	// must be the last value
};

/* Known 1st v(1) rev sorted by freq */
static int64_t best_v1_reverse_sorted_by_freq[] = {
    3, 5, 9, 11, 15, 17, 21, 29, 20, 27, 35, 36, 39, 41, 45, 32, 51,
    44, 56, 49, 59, 57, 65, 55, 69, 71, 77, 66, 81, 95, 72, 80, 67, 99,
    84, 74, 90, 104, 105, 87, 116, 101, 109, 125, 111, 135,
    -1	// must be the last value
};

/* Odd Known 1st v(1) rev sorted by freq */
static int64_t best_v1_reverse_sorted_by_oddfreq[] = {
    3, 5, 9, 11, 15, 17, 21, 29, 27, 35, 39, 41, 31, 45, 51, 55, 49,
    59, 69, 71, 65, 57, 85, 81, 95, 99, 77, 53, 67, 105, 101, 109, 125,
    87, 129, 83, 111, 155, 107, 135, 139, 141, 149, 165,
    -1	// must be the last value
};

/* 1st v(1) from large verified primes rev sorted by freq */
static int64_t best_v1_verified_prime[] = {
    3, 5, 9, 11, 15, 17, 21, 27, 29, 35, 39, 41, 45, 51, 57, 59, 65, 69, 81,
    -1	// must be the last value
};
static int64_t largest_odd_v1_verified_prime = 81;	// largest in list above

int
main(int argc, char *argv[])
{
    extern char *optarg;	// an option argument
    extern int optind;		// index to the next argv argument
    int opt;			// getopt() return
    ssize_t parse_jacobi_line_ret;	// return from parse_jacobi_line()
    uint64_t h = 0;		// h multiper from a h, n, Jacobi +-0 line
    uint64_t n = 0;		// n multiper from a h, n, Jacobi +-0 line
    const char *jstr = NULL;	// Jacobi +-0 string from a h, n, Jacobi line
    bool v1_found_in_loop = false;	// found a valid v(1) in a given loop
    int i;
    /**/
    char *filename_global_stats = NULL;	// global.stats filename
    FILE *file_global_stats = NULL;	// open steam for global.stats
    stats stats;			// global stastics structure
    /**/
    char *filename_tally_int = NULL;	// tally.int filename - valid v(1)
    FILE *file_tally_int = NULL;	// open stream for tally.int
    tally tally_int;			// tally of valid v(1) - consecutive integers
    cache cache_int;			// cache for tally.int a line
    /**/
    char *filename_tally_1stint = NULL;	// tally.1stint filename - smallest valid v(1)
    FILE *file_tally_1stint = NULL;	// open stream for tally.1stint
    tally tally_1stint;			// tally of smallest valid v(1) - consecutive integers
    cache cache_1stint;			// cache for tally.1stint a line
    /**/
    char *filename_tally_odd = NULL;	// tally.odd filename - valid odd v(1)
    FILE *file_tally_odd = NULL;	// open stream for tally.odd
    tally tally_odd;			// tally of valid odd v(1) - consecutive odd integers
    cache cache_odd;			// cache for tally.odd a line
    /**/
    char *filename_tally_1stodd = NULL;	// tally.1stodd filename - smallest valid odd v(1)
    FILE *file_tally_1stodd = NULL;	// open stream for tally.1stodd
    tally tally_1stodd;			// tally of smallest valid odd v(1) - consecutive odd integers
    cache cache_1stodd;			// cache for tally.1stodd a line
    /**/
    char *filename_best_by_freq = NULL;	// tally.byfreq filename - common for 0mod3 reverse sorted by frequency of use
    FILE *file_best_by_freq = NULL;	// open stream for tally.byfreq
    tally tally_best_by_freq;		// tally of valid v(1) - common for 0mod3 reverse sorted by frequency of use
    cache cache_best_by_freq;		// cache for tally.byfreq a line
    /**/
    char *filename_best_by_v1 = NULL;	// tally.byv1 filename - common for 0mod3 sorted by v(1)
    FILE *file_best_by_v1 = NULL;	// open stream for tally.byv1
    tally tally_best_by_v1;		// tally of valid v(1) - common for 0mod3 sorted by v(1)
    cache cache_best_by_v1;		// cache for tally.byv1 a line
    /**/
    char *filename_best_by_oddfreq = NULL; // tally.byoddfreq filename -
					   // common odd for 0mod3 reverse sorted by frequency of use
    FILE *file_best_by_oddfreq = NULL;	// open stream for tally.byoddfreq
    tally tally_best_by_oddfreq;	// tally of valid odd v(1) - common for 0mod3 reverse sorted by frequency of use
    cache cache_best_by_oddfreq;	// cache for tally.byfreq a line
    /**/
    char *filename_best_by_oddv1 = NULL; // tally.byoddv1 filename - common odd for 0mod3 sorted by v(1)
    FILE *file_best_by_oddv1 = NULL;	// open stream for tally.byoddv1
    tally tally_best_by_oddv1;		// tally of valid odd v(1) - common for 0mod3 sorted by v(1)
    cache cache_best_by_oddv1;		// cache for tally.byv1 a line
    /**/
    char *filename_best_prime = NULL;	// tally.prime filename - smallest valid 1st v(1) for verifed primes h=0 mod 3, n>= 1000
    FILE *file_best_prime = NULL;	// open stream for tally.prime
    tally tally_best_prime;		// tally of v(1) from verifed primes - common for 0mod3 sorted by v(1)
    cache cache_best_prime;		// cache for tally.prime a line

    /*
     * parse command line
     */
    program = argv[0];	// save our program name
    while ((opt = getopt(argc, argv, "hv:")) != -1) {
	switch (opt) {
	case 'h':
	    usage_msg(0, program);
	    /*NOTREACHED*/
	    break;
	case 'v':
	    /* parse verbosity */
	    errno = 0;
	    debuglevel = strtol(optarg, NULL, 0);
	    if (errno != 0) {
		usage_err(1, __func__, "cannot parse -v arg: %s", optarg);
		/*NOTREACHED*/
	    }
	    break;
	default:
	    usage_err(1, __func__, "unknown option: -%c", opt);
	    /*NOTREACHED*/
	    break;
	}
    }
    /* advance over getopt() parsed args */
    argc -= optind;
    argv += optind;
    if (argc != 10) {
	usage_err(1, __func__, "expected 10 arguments");
	/*NOTREACHED*/
    }
    filename_global_stats = argv[0];
    dbg(DBG_LOW, "global.stats filename: %s", filename_global_stats);
    filename_tally_int = argv[1];
    dbg(DBG_LOW, "tally.int filename: %s", filename_tally_int);
    filename_tally_1stint = argv[2];
    dbg(DBG_LOW, "filename_tally_1stint filename: %s", filename_tally_1stint);
    filename_tally_odd = argv[3];
    dbg(DBG_LOW, "filename_tally_odd filename: %s", filename_tally_odd);
    filename_tally_1stodd = argv[4];
    dbg(DBG_LOW, "filename_tally_1stodd filename: %s", filename_tally_1stodd);
    filename_best_by_freq = argv[5];
    dbg(DBG_LOW, "filename_best_by_freq filename: %s", filename_best_by_freq);
    filename_best_by_v1 = argv[6];
    dbg(DBG_LOW, "filename_best_by_v1 filename: %s", filename_best_by_v1);
    filename_best_by_oddfreq = argv[7];
    dbg(DBG_LOW, "filename_best_by_oddfreq filename: %s", filename_best_by_oddfreq);
    filename_best_by_oddv1 = argv[8];
    dbg(DBG_LOW, "filename_best_by_oddv1 filename: %s", filename_best_by_oddv1);
    filename_best_prime = argv[9];
    dbg(DBG_LOW, "filename_best_prime filename: %s", filename_best_prime);

    /*
     * open for writing, the global stats file
     */
    file_global_stats = fopen(filename_global_stats, "w");
    if (file_global_stats == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_global_stats);
	/*NOTREACHED*/
    }

    /*
     * open for writing, the tally files
     */
    file_tally_int = fopen(filename_tally_int, "w");
    if (file_tally_int == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_tally_int);
	/*NOTREACHED*/
    }
    file_tally_1stint = fopen(filename_tally_1stint, "w");
    if (file_tally_1stint == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_tally_1stint);
	/*NOTREACHED*/
    }
    file_tally_odd = fopen(filename_tally_odd, "w");
    if (file_tally_odd == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_tally_odd);
	/*NOTREACHED*/
    }
    file_tally_1stodd = fopen(filename_tally_1stodd, "w");
    if (file_tally_1stodd == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_tally_1stodd);
	/*NOTREACHED*/
    }
    file_best_by_freq = fopen(filename_best_by_freq, "w");
    if (file_best_by_freq == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_best_by_freq);
	/*NOTREACHED*/
    }
    file_best_by_v1 = fopen(filename_best_by_v1, "w");
    if (file_best_by_v1 == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_best_by_v1);
	/*NOTREACHED*/
    }
    file_best_by_oddfreq = fopen(filename_best_by_oddfreq, "w");
    if (file_best_by_oddfreq == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_best_by_oddfreq);
	/*NOTREACHED*/
    }
    file_best_by_oddv1 = fopen(filename_best_by_oddv1, "w");
    if (file_best_by_oddv1 == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_best_by_oddv1);
	/*NOTREACHED*/
    }
    file_best_prime = fopen(filename_best_prime, "w");
    if (file_best_prime == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_best_prime);
	/*NOTREACHED*/
    }

    /*
     * initialize
     */
    dbg(DBG_LOW, "about to initialize counters");
    counter_init(&stats);
    dbg(DBG_LOW, "about to initialize tallies");
    tally_init(&tally_int);
    tally_init(&tally_1stint);
    tally_init(&tally_odd);
    tally_init(&tally_1stodd);
    tally_init(&tally_best_by_freq);
    tally_init(&tally_best_by_v1);
    tally_init(&tally_best_by_oddfreq);
    tally_init(&tally_best_by_oddv1);
    tally_init(&tally_best_prime);
    dbg(DBG_LOW, "about to initialize caches");
    cache_init(&cache_int);
    cache_init(&cache_1stint);
    cache_init(&cache_odd);
    cache_init(&cache_1stodd);
    cache_init(&cache_best_by_freq);
    cache_init(&cache_best_by_v1);
    cache_init(&cache_best_by_oddfreq);
    cache_init(&cache_best_by_oddv1);
    cache_init(&cache_best_prime);

    /*
     * process stdin for h, n, Jacobi +-0 lines
     */
    dbg(DBG_LOW, "about to process stdin");
    while ((parse_jacobi_line_ret = parse_jacobi_line(&h, &n, &jstr, stdin)) > 0) {

	int v1;			// potential v(1) value
	int max_v1;		// maximum potential v(1) for a line
	bool valid_v1;		// true ==> v1 is a valid v(1) value
	bool saw_valid_v1;	// true ==> we have seen a valid v(1) for this line
	bool saw_valid_odd_v1;	// true ==> we have seen a valid odd v(1) for this line
	bool h_zeromod3;	// true ==> h == 0 mod 3

	/*
	 * determine if h == 0 mod 3
	 */
	h_zeromod3 = ((h % 3) == 0);

	/*
	 * handle line parse errors
	 */
	if (jacobi_lineno%100000 == 0) {
	    dbg(DBG_LOW, "parsed line number: %d", jacobi_lineno);
	} else {
	    dbg(DBG_VHIGH, "parsed line number: %d", jacobi_lineno);
	}
	if (parse_jacobi_line_ret < JACOBI_MIN_LEN) {
	    dbg(DBG_MED, "parse error: %d, skiping line: %d", parse_jacobi_line_ret, jacobi_lineno);
	    continue;
	}

	/*
	 * configure caches for this Jacobi +-0 line
	 */
	dbg(DBG_VHIGH, "about to confiure caches for length length: %u", parse_jacobi_line_ret);
	cache_config(&cache_int, parse_jacobi_line_ret);
	cache_config(&cache_1stint, parse_jacobi_line_ret);
	cache_config(&cache_odd, parse_jacobi_line_ret);
	cache_config(&cache_1stodd, parse_jacobi_line_ret);
	cache_config(&cache_best_by_freq, parse_jacobi_line_ret);
	cache_config(&cache_best_by_v1, parse_jacobi_line_ret);
	cache_config(&cache_best_by_oddfreq, parse_jacobi_line_ret);
	cache_config(&cache_best_by_oddv1, parse_jacobi_line_ret);
	cache_config(&cache_best_prime, parse_jacobi_line_ret);

	/*
	 * loop over potential v(1) values in a linear fashion
	 *
	 * The mathematics of the Riesel test for h*2^n-1 makes DEF_MIN_V1 the minimun
	 * possible value.  This minimum value is 3 because the Riesel test requires:
	 *
	 *	J(3-2, h*2^n-1) == 1 ??
	 *	J(1, h*2^n-1) == 1 ??
	 *
	 * 	NOTE: 1 is the minimum 1st argument for a Jacobi symbol.
	 *
	 * The valid index for this jstr line is [0, parse_jacobi_line_ret-1].
	 * The other Riesel test requires, for a valid v(1);
	 *
	 *	J(parse_jacobi_line_ret-1-2, h*2^n-1) == -1 ??
	 *	J(max_v1, h*2^n-1) == -1 ??
	 *
	 * So max_v1 == parse_jacobi_line_ret-1-2 is the maximum v(1) value for this line.
	 */
	max_v1 = parse_jacobi_line_ret-1-2;		// maximum potential v(1) for this line
	saw_valid_v1 = false;
	saw_valid_odd_v1 = false;
	for (v1=DEF_MIN_V1; v1 <= max_v1; ++v1) {

	    /*
	     * gather stats for the 3 other caches
	     */
	    if (! saw_valid_v1) {
		(void) v1_check(jstr, v1, h_zeromod3, &cache_1stint);
	    }
	    if ((v1%2) == 1) {
		(void) v1_check(jstr, v1, h_zeromod3, &cache_odd);
		if (! saw_valid_odd_v1) {
		    (void) v1_check(jstr, v1, h_zeromod3, &cache_1stodd);
		}
	    }

	    /*
	     * skip this v1 if NOT a valid v(1)
	     */
	    valid_v1 = v1_check(jstr, v1, h_zeromod3, &cache_int);
	    if (!valid_v1) {
		dbg(DBG_VVHIGH, "h: %"PRIu64" n: %"PRIu64" v1: %d is NOT valid", h, n, v1);
		continue;
	    }

	    /*
	     * tally of valid v(1) for consecutive integers
	     */
	    tally_value(&tally_int, v1);

	    /*
	     * if first for this line, tally of smallest valid v(1) for consecutive integers
	     */
	    if (! saw_valid_v1) {
		dbg(DBG_VHIGH, "h: %"PRIu64" n: %"PRIu64" v1: %d is first valid", h, n, v1);
		tally_value(&tally_1stint, v1);
		saw_valid_v1 = true;
	    } else {
		dbg(DBG_VHIGH, "h: %"PRIu64" n: %"PRIu64" v1: %d is valid", h, n, v1);
	    }

	    /*
	     * skip the rest of the processing if v(1) is even
	     */
	    if ((v1%2) == 0) {
		continue;
	    }

	    /*
	     * tally of valid odd v(1) for consecutive odd integers
	     */
	    tally_value(&tally_odd, v1);

	    /*
	     * if first for this line, tally of smallest valid v(1) for consecutive integers
	     */
	    if (! saw_valid_odd_v1) {
		dbg(DBG_VHIGH, "h: %"PRIu64" n: %"PRIu64" v1: %d is first odd valid", h, n, v1);
		tally_value(&tally_1stodd, v1);
		saw_valid_odd_v1 = true;
	    } else {
		dbg(DBG_VHIGH, "h: %"PRIu64" n: %"PRIu64" v1: %d is odd valid", h, n, v1);
	    }
	}
	if (! saw_valid_v1) {
	    ++stats.missed.valid_v1;
	} else {
	    ++stats.found.valid_v1;
	}
	if (! saw_valid_odd_v1) {
	    ++stats.missed.valid_odd_v1;
	} else {
	    ++stats.found.valid_odd_v1;
	}

	/*
	 * loop over: common for 0mod3 case reverse sorted by frequency of use
	 */
	v1_found_in_loop = false;
	for (i=0; best_v1_reverse_sorted_by_freq[i] > 0; ++i) {

	    /*
	     * if v(1) is valid, stop seaching
	     */
	    v1 = best_v1_reverse_sorted_by_freq[i];
	    if (v1_check(jstr, v1, h_zeromod3, &cache_best_by_freq)) {
		tally_value(&tally_best_by_freq, v1);
		v1_found_in_loop = true;
		break;
	    }
	}
	if (! v1_found_in_loop) {
	    ++stats.missed.best_by_freq;
	} else {
	    ++stats.found.best_by_freq;
	}

	/*
	 * loop over: common for 0mod3 case sorted by v(1)
	 */
	v1_found_in_loop = false;
	for (i=0; best_v1_reverse_sorted_by_v1[i] > 0; ++i) {

	    /*
	     * if v(1) is valid, stop seaching
	     */
	    v1 = best_v1_reverse_sorted_by_v1[i];
	    if (v1_check(jstr, v1, h_zeromod3, &cache_best_by_v1)) {
		tally_value(&tally_best_by_v1, v1);
		v1_found_in_loop = true;
		break;
	    }
	}
	if (! v1_found_in_loop) {
	    ++stats.missed.best_by_v1;
	} else {
	    ++stats.found.best_by_v1;
	}

	/*
	 * loop over: common odd for 0mod3 case reverse sorted by frequency of use
	 */
	v1_found_in_loop = false;
	for (i=0; best_v1_reverse_sorted_by_oddfreq[i] > 0; ++i) {

	    /*
	     * if v(1) is valid, stop seaching
	     */
	    v1 = best_v1_reverse_sorted_by_oddfreq[i];
	    if (v1_check(jstr, v1, h_zeromod3, &cache_best_by_oddfreq)) {
		tally_value(&tally_best_by_oddfreq, v1);
		v1_found_in_loop = true;
		break;
	    }
	}
	if (! v1_found_in_loop) {
	    ++stats.missed.best_by_oddfreq;
	} else {
	    ++stats.found.best_by_oddfreq;
	}

	/*
	 * loop over: common odd for 0mod3 case sorted by v(1)
	 */
	v1_found_in_loop = false;
	for (i=0; best_v1_reverse_sorted_by_oddv1[i] > 0; ++i) {

	    /*
	     * if v(1) is valid, stop seaching
	     */
	    v1 = best_v1_reverse_sorted_by_oddv1[i];
	    if (v1_check(jstr, v1, h_zeromod3, &cache_best_by_oddv1)) {
		tally_value(&tally_best_by_oddv1, v1);
		v1_found_in_loop = true;
		break;
	    }
	}
	if (! v1_found_in_loop) {
	    ++stats.missed.best_by_oddv1;
	} else {
	    ++stats.found.best_by_oddv1;
	}

	/*
	 * loop over: 1st valid v(1) from verified primes with h=0mod3, n>=1000
	 *
	 * If our search falls off the best_v1_verified_prime[] list, then
	 * we start searching for odd v(1) > the largest value in the list.
	 */
	v1_found_in_loop = false;
	for (i=0; best_v1_verified_prime[i] > 0; ++i) {

	    /*
	     * if v(1) is valid, stop seaching
	     */
	    v1 = best_v1_verified_prime[i];
	    if (v1_check(jstr, v1, h_zeromod3, &cache_best_prime)) {
		tally_value(&tally_best_prime, v1);
		v1_found_in_loop = true;
		break;
	    }
	}
	/*
	 * If we did not find a v(1) in best_v1_verified_prime[], then
	 * start searching 2 above largest_odd_v1_verified_prime until
	 * we find a valid v(1) or fall off the jstr list.
	 */
	if (! v1_found_in_loop) {
	    dbg(DBG_HIGH, "verified prime v(1) beyond best_v1_verified_prime end: %d for "
			  "h: %"PRIu64" n: %"PRIu64, largest_odd_v1_verified_prime, h, n);
	    for (v1 = largest_odd_v1_verified_prime + 2; v1 <= max_v1; v1 += 2) {

		/*
		 * if v(1) is valid, stop seaching
		 */
		if (v1_check(jstr, v1, h_zeromod3, &cache_best_prime)) {
		    tally_value(&tally_best_prime, v1);
		    v1_found_in_loop = true;
		    break;
		}
	    }
	}
	if (! v1_found_in_loop) {
	    dbg(DBG_HIGH, "no valid v(1) found in best_v1_verified_prime[] nor "
			  "odd values >=  %"PRId64" and <= %d for h: %"PRIu64" n: %"PRIu64,
			  largest_odd_v1_verified_prime+2, max_v1, h, n);
	    ++stats.missed.best_prime;
	} else {
	    ++stats.found.best_prime;
	}
    }
    dbg(DBG_LOW, "stdin lines read: %d", jacobi_lineno);
    if (parse_jacobi_line_ret != JACOBI_LINE_EOF) {
	err(3, __func__, "parse_jacobi_line aborted with error code: %d", parse_jacobi_line_ret);
	/*NOTREACHED */
    }

    /*
     * reverse sort count array by count
     */
    dbg(DBG_LOW, "about to reverse sort count array by count");
    reverse_sort_by_count(&tally_int);
    reverse_sort_by_count(&tally_1stint);
    reverse_sort_by_count(&tally_odd);
    reverse_sort_by_count(&tally_1stodd);
    reverse_sort_by_count(&tally_best_by_freq);
    reverse_sort_by_count(&tally_best_by_v1);
    reverse_sort_by_count(&tally_best_by_oddfreq);
    reverse_sort_by_count(&tally_best_by_oddv1);
    reverse_sort_by_count(&tally_best_prime);

    /*
     * write information to tally files
     */
    dbg(DBG_LOW, "write information to tally files");
    write_stats(&tally_int, &cache_int,
		&stats.with_cache[E_tally_int].jop, &stats.without_cache[E_tally_int].jop,
		filename_tally_int, file_tally_int);
    fclose(file_tally_int);
    /**/
    write_stats(&tally_1stint, &cache_1stint,
		&stats.with_cache[E_tally_1stint].jop, &stats.without_cache[E_tally_1stint].jop,
		filename_tally_1stint, file_tally_1stint);
    fclose(file_tally_1stint);
    /**/
    write_stats(&tally_odd, &cache_odd,
		&stats.with_cache[E_tally_odd].jop, &stats.without_cache[E_tally_odd].jop,
		filename_tally_odd, file_tally_odd);
    fclose(file_tally_odd);
    /**/
    write_stats(&tally_1stodd, &cache_1stodd,
		&stats.with_cache[E_tally_1stodd].jop, &stats.without_cache[E_tally_1stodd].jop,
		filename_tally_1stodd, file_tally_1stodd);
    fclose(file_tally_1stodd);
    /**/
    write_stats(&tally_best_by_freq, &cache_best_by_freq,
		&stats.with_cache[E_tally_freq].jop, &stats.without_cache[E_tally_freq].jop,
		filename_best_by_freq, file_best_by_freq);
    fclose(file_best_by_freq);
    /**/
    write_stats(&tally_best_by_v1, &cache_best_by_v1,
		&stats.with_cache[E_tally_v1].jop, &stats.without_cache[E_tally_v1].jop,
		filename_best_by_v1, file_best_by_v1);
    fclose(file_best_by_v1);
    /**/
    write_stats(&tally_best_by_oddfreq, &cache_best_by_oddfreq,
		&stats.with_cache[E_tally_oddfreq].jop, &stats.without_cache[E_tally_oddfreq].jop,
		filename_best_by_oddfreq, file_best_by_oddfreq);
    fclose(file_best_by_oddfreq);
    /**/
    write_stats(&tally_best_by_oddv1, &cache_best_by_oddv1,
		&stats.with_cache[E_tally_oddv1].jop, &stats.without_cache[E_tally_oddv1].jop,
		filename_best_by_oddv1, file_best_by_oddv1);
    fclose(file_best_by_oddv1);
    /**/
    write_stats(&tally_best_prime, &cache_best_prime,
		&stats.with_cache[E_tally_prime].jop, &stats.without_cache[E_tally_prime].jop,
		filename_best_prime, file_best_prime);
    fclose(file_best_prime);

    /*
     * write global stats
     */
    dbg(DBG_LOW, "write global stats");
    write_global_stats(&stats, file_global_stats);
    fclose(file_global_stats);

    /*
     * All Done!!! -- Jessica Noll, Age 2
     */
    exit(0);
}
