/*
 * jacobi-data1 - 1st phase of Jacobi v(1) analysis
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

#include "debug.h"
#include "jacobi-parse.h"
#include "jacobi-stat.h"

/*
 * usage
 */
const char * usage =
"usage: %s [-h] [-v lvl] tally.int tally.1stint tally.odd tally.1stodd tally.byuse tally.byv1\n"
"\n"
"	-h		print usage message and exit\n"
"	-v lvl		set debugging level (def: 0 ==> none)\n"
"\n"
"	tally.int	tally of valid v(1) for consecutive integers\n"
"	tally.1stint	tally of smallest valid v(1) for consecutive integers\n"
"	tally.odd	tally of valid odd v(1) for consecutive odd integers\n"
"	tally.1stodd	tally of smallest valid odd v(1) for consecutive odd integers\n"
"	tally.byuse	tally of most common for 0mod3 case reverse sorted by use\n"
"	tally.byv1	tally of most common for 0mod3 case sorted by v(1)"
;

/* external variables */
const char *program = NULL;		// our name
const char version_string[] = "jacobi-data1 0.1";  // our package name and version
int debuglevel = DBG_NONE;		// print debug messages <= debuglevel
bool use_syslog = false;		// true ==> use syslog services msgs

/*
 * recommended v(1) search list
 *
 * Below are the counts associated with non-zero values from
 * all jobs run under:
 *
 *	job.h-0mod3.jobset/tally.1stint
 *
 * The best_v1_sorted_by_use[] is sorted in reverse order by count.
 * The best_v1_sorted_by_v1[] is sorted by valid v(1) value.
 *
 * NOTE The -1 value indicates end of list and is not part of the true list.
 */
static int64_t best_v1_sorted_by_use[] = {
    3, 5, 9, 11, 15, 17, 21, 29, 27, 35, 39, 41, 31, 45, 51, 55, 49,
    59, 69, 71, 57, 65, 85, 81, 95, 99, 77, 53, 67, 105, 101, 109, 125,
    87, 129, 83, 111, 155, 107, 135, 139, 141, 149, 165,
    -1	// just be the last value
};
static int64_t best_v1_sorted_by_v1[] = {
    3, 5, 9, 11, 15, 17, 21, 27, 29, 31, 35, 39, 41, 45, 49, 51, 53,
    55, 57, 59, 65, 67, 69, 71, 77, 81, 83, 85, 87, 95, 99, 101, 105,
    107, 109, 111, 125, 129, 135, 139, 141, 149, 155, 165,
    -1	// just be the last value
};

int
main(int argc, char *argv[])
{
    extern char *optarg;	// an option argument
    extern int optind;		// index to the next argv argument
    int opt;			// getopt() return
    ssize_t parse_jacobi_line_ret;	// return from parse_jacobi_line()
    uint64_t h = 0;			// h multiper from a h, n, Jacobi +-0 line
    uint64_t n = 0;			// n multiper from a h, n, Jacobi +-0 line
    const char *jstr = NULL;		// Jacobi +-0 string from a h, n, Jacobi +-0 line
    int i;
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
    char *filename_best_by_use = NULL;	// tally.byuse filename - most common for 0mod3 reverse sorted by use
    FILE *file_best_by_use = NULL;	// open stream for tally.byuse
    tally tally_best_by_use;		// tally of valid odd v(1) - common for 0mod3 reverse sorted by use
    cache cache_best_by_use;		// cache for tally.byuse a line
    /**/
    char *filename_best_by_v1 = NULL;	// tally.byv1 filename - most common for 0mod3 sorted by v(1)
    FILE *file_best_by_v1 = NULL;	// open stream for tally.byv1
    tally tally_best_by_v1;		// tally of valid odd v(1) - common for 0mod3 sorted by v(1)
    cache cache_best_by_v1;		// cache for tally.byv1 a line

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
    if (argc != 6) {
	usage_err(1, __func__, "expected 4 arguments");
	/*NOTREACHED*/
    }
    filename_tally_int = argv[0];
    dbg(DBG_LOW, "tally.int filename: %s", filename_tally_int);
    filename_tally_1stint = argv[1];
    dbg(DBG_LOW, "filename_tally_1stint filename: %s", filename_tally_1stint);
    filename_tally_odd = argv[2];
    dbg(DBG_LOW, "filename_tally_odd filename: %s", filename_tally_odd);
    filename_tally_1stodd = argv[3];
    dbg(DBG_LOW, "filename_tally_1stodd filename: %s", filename_tally_1stodd);
    filename_best_by_use = argv[4];
    dbg(DBG_LOW, "filename_best_by_use filename: %s", filename_best_by_use);
    filename_best_by_v1 = argv[5];
    dbg(DBG_LOW, "filename_tally_1stodd filename: %s", filename_best_by_v1);

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
    file_best_by_use = fopen(filename_best_by_use, "w");
    if (file_best_by_use == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_best_by_use);
	/*NOTREACHED*/
    }
    file_best_by_v1 = fopen(filename_best_by_v1, "w");
    if (file_best_by_v1 == NULL) {
	errp(2, __func__, "cannot open for writing: %s", filename_best_by_v1);
	/*NOTREACHED*/
    }

    /*
     * initialize tallies and caches
     */
    dbg(DBG_LOW, "about to initialize tallies");
    tally_init(&tally_int);
    tally_init(&tally_1stint);
    tally_init(&tally_odd);
    tally_init(&tally_1stodd);
    tally_init(&tally_best_by_use);
    tally_init(&tally_best_by_v1);
    dbg(DBG_LOW, "about to initialize caches");
    cache_init(&cache_int);
    cache_init(&cache_1stint);
    cache_init(&cache_odd);
    cache_init(&cache_1stodd);
    cache_init(&cache_best_by_use);
    cache_init(&cache_best_by_v1);

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
	cache_config(&cache_best_by_use, parse_jacobi_line_ret);
	cache_config(&cache_best_by_v1, parse_jacobi_line_ret);

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
		(void) v1_check(jstr, v1, &cache_1stint);
	    }
	    if ((v1%2) == 1) {
		(void) v1_check(jstr, v1, &cache_odd);
		if (! saw_valid_odd_v1) {
		    (void) v1_check(jstr, v1, &cache_1stodd);
		}
	    }

	    /*
	     * skip this v1 if NOT a valid v(1)
	     */
	    valid_v1 = v1_check(jstr, v1, &cache_int);
	    if (!valid_v1) {
		dbg(DBG_VVHIGH, "h: "PRIu64" n: "PRIu64" v1: %d is NOT valid", h, n, v1);
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
		dbg(DBG_VHIGH, "h: "PRIu64" n: "PRIu64" v1: %d is first valid", h, n, v1);
		tally_value(&tally_1stint, v1);
		saw_valid_v1 = true;
	    } else {
		dbg(DBG_VHIGH, "h: "PRIu64" n: "PRIu64" v1: %d is valid", h, n, v1);
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
		dbg(DBG_VHIGH, "h: "PRIu64" n: "PRIu64" v1: %d is first odd valid", h, n, v1);
		tally_value(&tally_1stodd, v1);
		saw_valid_odd_v1 = true;
	    } else {
		dbg(DBG_VHIGH, "h: "PRIu64" n: "PRIu64" v1: %d is odd valid", h, n, v1);
	    }
	}

	/*
	 * loop over most common for 0mod3 case reverse sorted by use
	 */
	for (i=0; best_v1_sorted_by_use[i] > 0; ++i) {

	    /*
	     * if v(1) is valid, stop seaching
	     */
	    v1 = best_v1_sorted_by_use[i];
	    if (v1_check(jstr, v1, &cache_best_by_use)) {
		tally_value(&tally_best_by_use, v1);
		break;
	    }
	}

	/*
	 * loop over most common for 0mod3 case sorted by v(1)
	 */
	for (i=0; best_v1_sorted_by_v1[i] > 0; ++i) {

	    /*
	     * if v(1) is valid, stop seaching
	     */
	    v1 = best_v1_sorted_by_v1[i];
	    if (v1_check(jstr, v1, &cache_best_by_v1)) {
		tally_value(&tally_best_by_v1, v1);
		break;
	    }
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
    reverse_sort_by_count(&tally_best_by_use);
    reverse_sort_by_count(&tally_best_by_v1);

    /*
     * write information to tally files
     */
    dbg(DBG_LOW, "write information to tally files");
    write_stats(&tally_int, &cache_int, file_tally_int);
    fclose(file_tally_int);
    /**/
    write_stats(&tally_1stint, &cache_1stint, file_tally_1stint);
    fclose(file_tally_1stint);
    /**/
    write_stats(&tally_odd, &cache_odd, file_tally_odd);
    fclose(file_tally_odd);
    /**/
    write_stats(&tally_1stodd, &cache_1stodd, file_tally_1stodd);
    fclose(file_tally_1stodd);
    /**/
    write_stats(&tally_best_by_use, &cache_best_by_use, file_best_by_use);
    fclose(file_best_by_use);
    /**/
    write_stats(&tally_best_by_v1, &cache_best_by_v1, file_best_by_v1);
    fclose(file_best_by_v1);

    /*
     * All Done!!! -- Jessica Noll, Age 2
     */
    exit(0);
}
