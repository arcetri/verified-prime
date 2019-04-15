/*
 * find-v1 - find the h and n where a given v(1) value is valid
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
"usage: %s [-h] [-v lvl] [-s] [-o] v1\n"
"\n"
"	-h	print usage message and exit\n"
"	-v lvl	set debugging level (def: 0 ==> none)\n"
"\n"
"	-s	search only for v(1) that are the first valid v(1)\n"
"	-o	search for odd v(1) only\n"
"\n"
"	v1	print h and n from stdin where v1 is a valid v(1) for\n"
"		testing the primality of h*2^n-1"
;

/* external variables */
const char *program = NULL;		// our name
const char version_string[] = "find-v1 1.0";  // our package name and version
int debuglevel = DBG_NONE;		// print debug messages <= debuglevel
bool use_syslog = false;		// true ==> use syslog services msgs

int
main(int argc, char *argv[])
{
    extern char *optarg;		// an option argument
    extern int optind;			// index to the next argv argument
    int opt;				// getopt() return
    bool first_only = false;		// true ==> only search for v(1) that are the first valid v(1)
    bool odd_only = false;		// true ==> only search for odd v(1)
    int step_v1 = 1;		// step size for v(1) search (1 or 2)
    ssize_t parse_jacobi_line_ret;	// return from parse_jacobi_line()
    uint64_t h = 0;			// h multiper from a h, n, Jacobi +-0 line
    uint64_t n = 0;			// n multiper from a h, n, Jacobi +-0 line
    const char *jstr = NULL;		// Jacobi +-0 string from a h, n, Jacobi line
    int find_v1;			// v(1) value to look for
    cache cache_int;			// cache for tally.int a line
    long found_v1 = 0;			// number of matchng v(1) found

    /*
     * parse command line
     */
    program = argv[0];	// save our program name
    while ((opt = getopt(argc, argv, "hv:so")) != -1) {
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
		usage_err(2, __func__, "cannot parse -v arg: %s", optarg);
		/*NOTREACHED*/
	    }
	    break;
	case 's':
	    first_only = true;
	    break;
	case 'o':
	    odd_only = true;
	    step_v1 = 2;
	    break;
	default:
	    usage_err(2, __func__, "unknown option: -%c", opt);
	    /*NOTREACHED*/
	    break;
	}
    }
    /* advance over getopt() parsed args */
    argc -= optind;
    argv += optind;
    if (argc != 1) {
	usage_err(2, __func__, "expected 1 argument");
	/*NOTREACHED*/
    }
    errno = 0;
    find_v1 = strtol(argv[0], NULL, 0);
    if (errno != 0) {
	usage_err(2, __func__, "cannot parse v1 arg: %s");
	/*NOTREACHED*/
    }
    if (first_only) {
	dbg(DBG_LOW, "searching for h and n where %d is the first valid v(1)", find_v1);
    } else {
	dbg(DBG_LOW, "searching for h and n where %s is the a valid v(1)", find_v1);
    }

    /*
     * initialize tallies and caches
     */
    dbg(DBG_LOW, "about to initialize caches");
    cache_init(&cache_int);

    /*
     * process stdin for h, n, Jacobi +-0 lines
     */
    dbg(DBG_LOW, "about to process stdin");
    while ((parse_jacobi_line_ret = parse_jacobi_line(&h, &n, &jstr, stdin)) > 0) {

	int v1;			// potential v(1) value
	int max_v1;		// maximum potential v(1) for a line
	bool valid_v1;		// true ==> v1 is a valid v(1) value
	bool saw_valid_v1;	// true ==> we have seen a valid v(1) for this line
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
	for (v1=DEF_MIN_V1; v1 <= max_v1; v1 += step_v1) {

	    /*
	     * if -o odd only, step up and even v1
	     */
	   if (odd_only && ((v1%2) == 0)) {
		++v1;
	   }

	    /*
	     * skip this v1 if NOT a valid v(1)
	     */
	    valid_v1 = v1_check(jstr, v1, h_zeromod3, &cache_int);
	    if (valid_v1) {
		dbg(DBG_VHIGH, "h: %"PRIu64" n: %"PRIu64" v1: %d is valid", h, n, v1);
		saw_valid_v1 = true;
	    } else {
		dbg(DBG_VVHIGH, "h: %"PRIu64" n: %"PRIu64" v1: %d is NOT valid", h, n, v1);
		continue;
	    }

	    /*
	     * report and stop on match
	     */
	    if (find_v1 == v1) {
		printf("h = %"PRIu64" n = %"PRIu64" v1 = %d\n", h, n, v1);
		++found_v1;
		break;
	    }

	    /*
	     * if we are searching for first v(1) and we found a different 1st valid v(1), stop the search
	     */
	    if (first_only && saw_valid_v1) {
		dbg(DBG_MED, "first valid v(1): %d != our search value: %d", v1, find_v1);
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
     * All Done!!! -- Jessica Noll, Age 2
     */
    if (found_v1 == 0) {
	if (first_only) {
	    if (odd_only) {
		dbg(DBG_LOW, "no 1st odd valid v(1) found: %d", find_v1);
	    } else {
		dbg(DBG_LOW, "no 1st valid v(1) found: %d", find_v1);
	    }
	} else {
	    if (odd_only) {
		dbg(DBG_LOW, "no odd valid v(1) found: %d", find_v1);
	    } else {
		dbg(DBG_LOW, "no valid v(1) found: %d", find_v1);
	    }
	}
	exit(1);
    } else {
	if (first_only) {
	    if (odd_only) {
		dbg(DBG_LOW, "found %d 1st odd valid v(1): %d", found_v1, find_v1);
	    } else {
		dbg(DBG_LOW, "found %d 1st valid v(1): %d", found_v1, find_v1);
	    }
	} else {
	    if (odd_only) {
		dbg(DBG_LOW, "found %d odd valid v(1): %d", found_v1, find_v1);
	    } else {
		dbg(DBG_LOW, "found %d valid v(1): %d", found_v1, find_v1);
	    }
	}
    }
    exit(0);
}
