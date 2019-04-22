#!/usr/bin/bash -
#
# wait-until-le-jobcount.sh - wait until use has SLURM queued <= job count
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

# setup
#
export COUNT_SLURM_JOBS_SH="./count-slurm-jobs.sh"

# parse args
#
export USAGE="usage: $0 [-h] [-w secs] [-v] min_count

    -h		print help and exit 0

    -w secs	wait secs between job count checking (def: $SECS)
    -v		be verhose while waiting

    min_count	wait until user has <= min_count jobs queued"
export FORCE=
export SECS=60
export VERBOSE=
while getopts :hw:v flag; do
    case "$flag" in
    h)  echo "$USAGE" 1>&2
	exit 0
	;;
    w)  SECS="$OPTARG"
	if [[ ! $SECS =~ ^[0-9]+$ ]]; then
	    echo "$0: FATAL: secs must be an integer >= 0" 1>&2
	    echo "$USAGE" 1>&2
	    exit 1
	fi
	;;
    v)  VERBOSE="-v"
	;;
    \?) echo "$0: invalid option: -$OPTARG" 1>&2
	echo "$USAGE" 1>&2
	exit 1
	;;
    :)  echo "$0: option -$OPTARG requires an argument" 1>&2
	echo "$USAGE" 1>&2
	exit 1
	;;
    esac
done
shift $(( OPTIND - 1 ));
if [[ $# -ne 1 ]]; then
    echo "$0: expected 1 args" 1>&2
    echo "$USAGE" 1>&2
    exit 1
fi
export MIN_COUNT="$1"
if [[ ! $MIN_COUNT =~ ^[0-9]+$ || $MIN_COUNT -lt 1 ]]; then
    echo "$0: FATAL: count must be an integer > 0" 1>&2
    exit 2
fi
if [[ -n $VERBOSE ]]; then
    echo "$0: Notice: waiting until <= $MIN_COUNT jobs"
    echo "$0: Notice: waiting up to $SECS secs between checks"
fi

# firewall
#
if [[ -z $COUNT_SLURM_JOBS_SH ]]; then
    echo "$0: FATAL: cannot find the executable: $COUNT_SLURM_JOBS_SH" 1>&2
    exit 3
fi

# wait until job count is <= min_count
#
export COUNT=$("$COUNT_SLURM_JOBS_SH")
if [[ -z $COUNT ]]; then
    echo "$0: Warning: empty count returned by: $COUNT_SLURM_JOBS_SH" 1>&2
elif [[ ! $MIN_COUNT =~ ^[0-9]+$ ]]; then
    echo "$0: Warning: clearing non-numeric count returned by: $COUNT_SLURM_JOBS_SH" 1>&2
    COUNT=
fi
if [[ -n $VERBOSE ]]; then
    echo "$0: Notice: $(date) job count: $COUNT"
fi
while [[ -z $COUNT || $COUNT -gt $MIN_COUNT ]]; do

    # wait before recounting
    #
    sleep "$SECS"

    # recount
    #
    COUNT=$("$COUNT_SLURM_JOBS_SH")
    if [[ -z $COUNT ]]; then
	echo "$0: Warning: empty count returned by: $COUNT_SLURM_JOBS_SH" 1>&2
    elif [[ ! $MIN_COUNT =~ ^[0-9]+$ ]]; then
	echo "$0: Warning: clearing non-numeric count returned by: $COUNT_SLURM_JOBS_SH" 1>&2
	COUNT=
    fi
    if [[ -n $VERBOSE ]]; then
	echo "$0: Notice: $(date) job count: $COUNT"
    fi
done

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
