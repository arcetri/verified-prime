#!/usr/bin/make
#
# v1-data - analyize v(1) use in Riesel primality tests
#
# Copyright (c) 2019 by Landon Curt Noll.  All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# chongo (Landon Curt Noll, http://www.isthe.com/chongo/index.html) /\oo/\
#
# Share and enjoy! :-)


SHELL= /bin/bash
CC= cc
CFLAGS= -march=native -O3 -g3 -std=c11 -Wall -Werror -pedantic
RM= rm

INSTALL= install

DESTDIR= /usr/global/bin

SHELL_TOOLS= form.slurm.sh gen.all.sh gen.job.sh gen.primejob.sh \
    launch.jobset.sh jacobi.all.sh jacobi.jobset.sh jacobi.prime.sh \
    jacobi.tally.sh

C_SRC= debug.c jacobi-parse.c jacobi-stat.c jacobi-data1.c
H_SRC= debug.h jacobi-parse.h jacobi-stat.h

OBJS= debug.o jacobi-parse.o jacobi-stat.o jacobi-data1.o

TARGETS= jacobi-data1

all: ${OBJS} ${TARGETS}

debug.o: debug.c debug.h
	${CC} ${CFLAGS} debug.c -c

jacobi-parse.o: jacobi-parse.c debug.h jacobi-parse.h
	${CC} ${CFLAGS} jacobi-parse.c -c

jacobi-stat.o: jacobi-stat.c debug.h jacobi-parse.h jacobi-stat.h
	${CC} ${CFLAGS} jacobi-stat.c -c

jacobi-data1.o: jacobi-data1.c debug.h jacobi-parse.h jacobi-stat.h
	${CC} ${CFLAGS} jacobi-data1.c -c

jacobi-data1: debug.o jacobi-parse.o jacobi-stat.o jacobi-data1.o
	${CC} ${CFLAGS} ${OBJS} -o $@

configure:

clean quick_clean quick_distclean distclean:
	${RM} -f ${OBJS} ${TARGETS}

clobber quick_clobber: clean

install: all
	@echo perhaps ${INSTALL} -m 0555 ${TARGETS} ${DESTDIR}
