/*
 * jacobi-parse - parse a jacobi.* file line
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

#if !defined(INCLUDE_JACOBI_PARSE_H)
#    define INCLUDE_JACOBI_PARSE_H

#define JACOBI_LINE_EOF		(0)	// EOF in reading
#define JACOBI_LINE_BADFMT	(1)	// unable to parse the: h n jstr
#define JACOBI_LINE_TOOSHORT	(2)	// Jacobi +-0 string is shorter than JACOBI_MIN_LEN
#define JACOBI_MIN_LEN		(3+2+1)	// Minimin v(1) is 3, need to Jacobi evaluate +2 beyond that,
					// and the final +1 is because we force strings to start with 0

extern unsigned long jacobi_lineno;	// lines read

extern ssize_t parse_jacobi_line(uint64_t *h_p, uint64_t *n_p, const char **j_str, FILE *stream);
extern void free_jacobi_line_buffer(void);

#endif	/* INCLUDE_JACOBI_PARSE_H */
