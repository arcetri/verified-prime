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

#include "debug.h"
#include "jacobi-parse.h"
#include "jacobi-stat.h"

/*
 * usage
 */
const char * usage = 
"usage: %s [-h] [-v lvl] tally.int tally.1stint tally.odd tally.1stodd\n"
"\n"
"	-h		print usage message and exit\n"
"	-v lvl		set debugging level (def: 0 ==> none)\n"
"\n"
"	tally.int	tally of valid v(1) - consecutive integers\n"
"	tally.1stint	tally of smallest valid v(1) - consecutive integers\n"
"	tally.odd	tally of valid odd v(1) - consecutive odd integers\n"
"	tally.1stodd	tally of smallest valid odd v(1) - consecutive odd integers"
;

/* external variables */
const char *program = NULL;		// our name
const char version_string[] = "jacobi-data1 0.1";  // our package name and version
int debuglevel = DBG_NONE;		// print debug messages <= debuglevel
bool use_syslog = false;		// true ==> use syslog services msgs

int
main(int argc, char *argv[])
{
    extern char *optarg;	// an option argument
    extern int optind;		// index to the next argv argument
    int opt;			// getopt() return
    char *file_tally_int;	// tally.int filename - valid v(1)
    char *file_tally_1stint;	// tally.1stint filename - smallest valid v(1)
    char *file_tally_odd;	// tally.odd filename - valid odd v(1)
    char *file_tally_1stodd;	// tally.1stodd filename - smallest valid odd v(1)

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
    if (argc != 4) {
	usage_err(1, __func__, "expected 4 arguments");
	/*NOTREACHED*/
    }
    file_tally_int = argv[0];
    dbg(DBG_LOW, "tally.int filename: %s", file_tally_int);
    file_tally_1stint = argv[1];
    dbg(DBG_LOW, "file_tally_1stint filename: %s", file_tally_1stint);
    file_tally_odd = argv[2];
    dbg(DBG_LOW, "file_tally_odd filename: %s", file_tally_odd);
    file_tally_1stodd = argv[3];
    dbg(DBG_LOW, "file_tally_1stodd filename: %s", file_tally_1stodd);

    /*
     * All Done!!! -- Jessica Noll, Age 2
     */
    exit(0);
}
