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

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>

#include "debug.h"
#include "jacobi-parse.h"

char *jacobi_line_buffer = NULL;	// getline buffer, will be malloced
unsigned long jacobi_lineno = 0;	// lines read


/*
 * read_line - parse a line on a stream
 *
 * given:
 * 	lineptr		pointer to malloced buffer, pass ptr to NULL to malloc
 * 	stream		open stream to read
 *
 * return:
 * 	> 0	number of characters read, not counting training newline
 * 	0	EOF
 *	< 0	error, or no trailing newline
 *
 * NOTE: Unlike getline, any trailing newline is converted to a NUL.
 * 	 The return value does not count the newline that was converted
 * 	 to a NUL.
 *
 * NOTE: If no training newline was found, then -1 is returned.
 *
 * NOTE: This function increments jacobi_lineno after getline() returns.
 *
 * NOTE: This function does not return on error.
 */
static ssize_t
read_line(char **lineptr, FILE *stream)
{
    size_t alloc_len = 0;	// size of allocated buffer
    ssize_t ret;		// getline() return - bytes read + \n

    /*
     * firewall
     */
    if (lineptr == NULL) {
	err(90, __func__, "lineptr is NULL (a ptr to NULL is OK)");
	/*NOTREACHED*/
    }
    if (stream == NULL) {
	err(90, __func__, "stream is NULL");
	/*NOTREACHED*/
    }

    /*
     * use getline
     */
    if (feof(stream)) {
	return 0;	// we are at EOF already
    }
    ret = getline(lineptr, &alloc_len, stream);
    ++jacobi_lineno;
    if (ret < 0) {
	errp(90, __func__, "getline returned < 0: %d", ret);
	/*NOTREACHED*/
    }
    /* paranoia */
    if (*lineptr == NULL) {
	err(90, __func__, "getline *lineptr is NULL");
	/*NOTREACHED*/
    }
    if (alloc_len < 1) {
	err(90, __func__, "getline alloc_len < 1: %u", alloc_len);
	/*NOTREACHED*/
    }

    /*
     * convert trailing newline to NUL
     *
     * The getline function returns the number of characters read,
     * including the trailing newline character. A count of 0 or 1
     * means no data was read, or an empty line was read, or
     * just a training newline was read.
     */
    if (ret < 2) {
	dbg(DBG_LOW, "getline return >= 0 and < 2: %d", ret);
	return -1;
    }
    if (ret > (ssize_t)alloc_len) {
	err(90, __func__, "getline return: %d > allocted buffer len: %u",
		ret, alloc_len);
	return -1;
    }
    if ((*lineptr)[ret-1] != '\n') {
	dbg(DBG_LOW, "no trailing newline found after %d bytes on line", ret);
	return -1;
    }
    (*lineptr)[ret-1] = '\0';

    /*
     * return line length not counting the newline that is now a NUL
     */
    return ret-1;
}


/*
 * parse_jacobi_line - parse an h, n, Jacobi +-0 line
 *
 * given:
 * 	h_p	pointer to h value parsed (as uint64_t)
 * 	n_p	pointer to n value parsed (as uint64_t)
 * 	j_srr	pointer to the Jacobi string
 * 	stream	open file to read from
 *
 * returns:
 * 	>=5	length of Jacobi +-0 string (>= JACOBI_MIN_LEN)
 * 	2	Jacobi +-0 string too short to process any v(1) (JACOBI_LINE_TOOSHORT)
 * 	1	line malformed (JACOBI_LINE_BADFMT)
 * 	0	EOF read (JACOBI_LINE_EOF)
 * 	<0	error
 *
 * When a non-NULL is returned, *h_p is updated to the parsed
 * value of h, *n_p is updated to the parsed value of n,
 * *len_p is updated to the length of Jacobi +-0 string.
 *
 * When NULL is returned, the values pointed at by h_p, n_p, len_p
 * have no meaning and should not be used.
 *
 * The buffer used is malloced or realloced on subsequent calls.
 * The contents of string returned should not be modified.
 *
 * NOTE: We "prepend" a '0' character to the front of the Jacobi +-0 string
 *	 so that the index of the Jacobi +-0 string starts with 0,
 *	 and so that the character associated with x is *j_str[x].
 *
 * NOTE: This function does not return on error.
 */
ssize_t
parse_jacobi_line(uint64_t *h_p, uint64_t *n_p, const char **j_str, FILE *stream)
{
     ssize_t len;		// length of line read, not counting newline
     int sscanf_ret;		// sscanf() tokens parsed
     uint64_t h = 0;		// parsed h value
     uint64_t n = 0;		// parsed n value
     size_t jacobi_len;		// length of Jacobi +-0 string
     size_t scan_len;		// length of +-0's chars in Jacobi +-0 string
     char *context = NULL;	// strtok_r context
     char *token_h;		// pointer to 1st token (pointer to h)
     char *token_n;		// pointer to 2nd token (pointer to n)
     char *token_str;		// pointer to 3nd token (pointer to Jacobi +-0 string)

    /*
     * firewall
     */
    if (h_p == NULL) {
	err(91, __func__, "h_p is NULL");
	/*NOTREACHED*/
    }
    if (n_p == NULL) {
	err(91, __func__, "n_p is NULL");
	/*NOTREACHED*/
    }
    if (j_str == NULL) {
	err(91, __func__, "j_str is NULL");
	/*NOTREACHED*/
    }
    if (stream == NULL) {
	err(91, __func__, "stream is NULL");
	/*NOTREACHED*/
    }

    /*
     * return NULL if we are already at EOF
     */
    if (feof(stream)) {
	dbg(DBG_HIGH, "stream is EOF");
	return JACOBI_LINE_EOF;
    }

    /*
     * read a line
     */
    len = read_line(&jacobi_line_buffer, stream);
    if (len == 0) {
	dbg(DBG_HIGH, "read_line returned 0, EOF found");
	return JACOBI_LINE_EOF;
    } else if (len < 0) {
	warn(__func__, "read_line returned <0: %d", len);
	return len;
    }

    /*
     * convert line into 3 tokens
     */
    token_h = strtok_r(jacobi_line_buffer, " ", &context);
    if (token_h == NULL) {
	warn(__func__, "unable to find 1st h token of line %ld", jacobi_lineno);
	return JACOBI_LINE_BADFMT;
    }
    token_n = strtok_r(NULL, " ", &context);
    if (token_n == NULL) {
	warn(__func__, "unable to find 2nd n token of line %ld", jacobi_lineno);
	return JACOBI_LINE_BADFMT;
    }
    token_str = strtok_r(NULL, " ", &context);
    if (token_str == NULL) {
	warn(__func__, "unable to find 3rd +-0 string token of line %ld", jacobi_lineno);
	return JACOBI_LINE_BADFMT;
    }

    /*
     * parse line
     */
    sscanf_ret = sscanf(token_h, "%"SCNu64, &h);
    if (sscanf_ret != 1) {
	warn(__func__, "line %ld sscanf of h returned %d != 3",
	     jacobi_lineno, sscanf_ret);
	return JACOBI_LINE_BADFMT;
    }
    if (h < 1) {
	warn(__func__, "line %ld h < 1: %"PRIu64, jacobi_lineno, h);
	return JACOBI_LINE_BADFMT;
    }
    sscanf_ret = sscanf(token_n, "%"SCNu64, &h);
    if (sscanf_ret != 1) {
	warn(__func__, "line %ld sscanf of n returned %d != 3",
	     jacobi_lineno, sscanf_ret);
	return JACOBI_LINE_BADFMT;
    }
    if (n < 1) {
	warn(__func__, "line %ld n < 1: %"PRIu64, jacobi_lineno, n);
	return JACOBI_LINE_BADFMT;
    }

    /*
     * force the string to start with 0
     *
     * The Jacobi +-0 strings read from the stream start with Jacobi value for 1.
     * We turn the previous deliminater, that was turned into a NUL character
     * by the last strtok_r() call above, into a '0' and backup token_str to
     * as to "prepended" a '0' character.
     */
    --token_str;
    if (*token_str != '\0') {
	warn(__func__, "line %ld delimiter before the +-0 string "
		        "was not converted to NUL by last strtok_r() call",
			jacobi_lineno);
	return JACOBI_LINE_BADFMT;
    }
    *token_str = '0';	// "prepended" a '0' character

    /*
     * sanity check the Jacobi string
     */
    jacobi_len = strlen(token_str);
    scan_len = strspn(token_str, "+-0");
    if (scan_len != jacobi_len) {
	warn(__func__, "line %ld str length: %u != +-0 length: %d",
	     jacobi_lineno, jacobi_len, scan_len);
	return JACOBI_LINE_BADFMT;
    }
    if (jacobi_len < JACOBI_MIN_LEN) {
	warn(__func__, "line %ld str length: %u < minimum length: %d",
	     jacobi_lineno, jacobi_len, JACOBI_MIN_LEN);
        return JACOBI_LINE_TOOSHORT;
    }

    /*
     * return success
     */
    *h_p = h;
    *n_p = n;
    *j_str = token_str;
    return jacobi_len;
}
