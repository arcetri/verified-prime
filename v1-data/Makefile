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
CTAGS= ctags

INSTALL= install

DESTDIR= /usr/global/bin

SHELL_TOOLS= form.slurm.sh gen.all.sh gen.job.sh gen.prime-all.sh \
    launch.job.sh jacobi.all.sh jacobi.baseline.sh jacobi.prime-all.sh \
    jacobi.tally.sh check-job-dir.sh gen.prime-small.sh gen.prime-large.sh \
    jacobi.prime-large.sh jacobi.jobsets.sh gen.all.sh count-slurm-jobs.sh \
    wait-until-le-jobcount.sh start-all-slurm-jobs.sh

C_MAIN= jacobi-gentally.c find-v1.c
C_SRC= debug.c jacobi-parse.c jacobi-stat.c
H_SRC= debug.h jacobi-parse.h jacobi-stat.h

GENTALLY_OBJS= debug.o jacobi-parse.o jacobi-stat.o
OBJS= ${GENTALLY_OBJS} jacobi-gentally.o find-v1.o

TARGETS= tags jacobi-gentally find-v1

all: ${OBJS} ${TARGETS}

debug.o: debug.c debug.h
	${CC} ${CFLAGS} debug.c -c

jacobi-parse.o: jacobi-parse.c debug.h jacobi-parse.h
	${CC} ${CFLAGS} jacobi-parse.c -c

jacobi-stat.o: jacobi-stat.c debug.h jacobi-parse.h jacobi-stat.h
	${CC} ${CFLAGS} jacobi-stat.c -c

jacobi-gentally.o: jacobi-gentally.c debug.h jacobi-parse.h jacobi-stat.h
	${CC} ${CFLAGS} jacobi-gentally.c -c

jacobi-gentally: ${GENTALLY_OBJS} jacobi-gentally.o
	${CC} ${CFLAGS} ${GENTALLY_OBJS} jacobi-gentally.o -o $@

find-v1.o: find-v1.c debug.h jacobi-parse.h jacobi-stat.h
	${CC} ${CFLAGS} find-v1.c -c

find-v1: ${GENTALLY_OBJS} find-v1.o
	${CC} ${CFLAGS} ${GENTALLY_OBJS} find-v1.o -o $@

tags: ${C_SRC} ${H_SRC}
	${RM} -f $@
	${CTAGS} ${C_MAIN} ${C_SRC} ${H_SRC}

configure:

clean quick_clean quick_distclean distclean:
	${RM} -f ${OBJS} ${TARGETS}

clobber quick_clobber: clean
	${RM} -f ${TAGS} tags

install: all
	@echo perhaps ${INSTALL} -m 0555 ${TARGETS} ${DESTDIR}
