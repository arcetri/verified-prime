#!/bin/bash -
#
# check-job-dir - check for bad or missing jobs in a job set
#
# We assume that for every sbatch file, there will be a non-empty
# jacobi file, non-empty list-h-n file, non-empty time file,
# and an empty stderr file.

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

# parse args
#
export USAGE="usage: $0 [-h] [-v] job.dir

    -h          print help and exit 0

    -v          be verbose

    job.dir	directory to check for bad or missing jobs in a job set"
export VERBOSE=
while getopts :hv flag; do
    case "$flag" in
    h)  echo $USAGE 1>&2;
	exit 0
	;;
    v)  VERBOSE=true
	;;
    \?) echo "$0: FATAL: invalid option: -$OPTARG" 1>&2
	exit 3
	;;
    :)  echo "$0: FATAL: option -$OPTARG requires an argument" 1>&2
	exit 4
	;;
    esac
done
shift $(( OPTIND - 1 ));
if [[ $# -ne 1 ]]; then
    echo "$0: FATAL: expected 1 arg" 1>&2
    echo $USAGE 1>&2
    exit 5
fi
export JOB_DIR="$1"
if [[ -n $VERBOSE ]]; then
    echo "$0: starting -v $JOB_DIR"
fi

# firewall
#
if [[ ! -d "$JOB_DIR" ]]; then
    echo "$0: FATAL: not a directory: $JOB_DIR" 1>&2
    exit 7
fi

# search based sbatch.jobid.slurm files
#
export EXIT_CODE=0
find "$JOB_DIR/" -mindepth 1 -maxdepth 1 -type f -name 'sbatch.*.slurm' -print | while read sfile; do

    # verify sbatch is non-empty
    #
    if [[ ! -s "$sfile" ]]; then
	RERUN=true
	if [[ -n $VERBOSE ]]; then
	    echo "$0: Notice: empty sbatch file: $sfile" 1>&2
	fi
    fi

    # obtain jobid
    #
    export JOB_ID=$(echo "$sfile" | sed -e 's/.*sbatch\.//' -e 's/\.slurm//')
    if [[ -z "$JOB_ID" ]]; then
	echo "$0: Warning: ignoring empty job id: $sfile" 1>&2
	EXIT_CODE=2
	continue
    fi
    export DIR=$(dirname "$sfile")
    if [[ -z "$DIR" ]]; then
	echo "$0: Warning: dirname is empty: $sfile" 1>&2
	EXIT_CODE=2
	continue
    fi
    export FILE=$(basename "$sfile")
    if [[ -z "$FILE" ]]; then
	echo "$0: Warning: filename is empty: $sfile" 1>&2
	EXIT_CODE=2
	continue
    fi
    export RERUN=

    # verify non-empty jacobi file
    #
    if [[ ! -s "$DIR/jacobi.$JOB_ID" ]]; then
	RERUN=true
	if [[ -n $VERBOSE ]]; then
	    if [[ -e "$DIR/jacobi.$JOB_ID" ]]; then
		echo "$0: Notice: empty jacobi file: $DIR/jacobi.$JOB_ID" 1>&2
	    else
		echo "$0: Notice: missing jacobi file: $DIR/jacobi.$JOB_ID" 1>&2
	    fi
	fi
    fi

    # verify non-empty list-h-n file
    #
    if [[ ! -s "$DIR/list-h-n.$JOB_ID" ]]; then
	RERUN=true
	if [[ -n $VERBOSE ]]; then
	    if [[ -e "$DIR/list-h-n.$JOB_ID" ]]; then
		echo "$0: Notice: empty list-h-n file: $DIR/list-h-n.$JOB_ID" 1>&2
	    else
		echo "$0: Notice: missing list-h-n file: $DIR/list-h-n.$JOB_ID" 1>&2
	    fi
	fi
    fi

    # verify non-empty time file
    #
    if [[ ! -s "$DIR/time.$JOB_ID" ]]; then
	RERUN=true
	if [[ -n $VERBOSE ]]; then
	    if [[ -e "$DIR/time.$JOB_ID" ]]; then
		echo "$0: Notice: empty time file: $DIR/time.$JOB_ID" 1>&2
	    else
		echo "$0: Notice: missing time file: $DIR/time.$JOB_ID" 1>&2
	    fi
	fi
    fi

    # verify missing stderr file
    #
    if [[ ! -f "$DIR/time.$JOB_ID" ]]; then
	RERUN=true
	if [[ -n $VERBOSE ]]; then
	    echo "$0: Notice: missing stderr file: $DIR/stderr.$JOB_ID" 1>&2
	fi
    elif [[ ! -s "$DIR/time.$JOB_ID" ]]; then
	RERUN=true
	if [[ -n $VERBOSE ]]; then
	    echo "$0: Notice: non-empty stderr file: $DIR/stderr.$JOB_ID" 1>&2
	    ls -l "$DIR/stderr.$JOB_ID" 1>&2
	fi
    fi

    # note if we need to rerun
    #
    if [[ -n "$RERUN" ]]; then
	echo "(cd $DIR; sbatch $FILE)"
	EXIT_CODE=1
    fi
done

# search based list-h-n files
#
find "$JOB_DIR/" -mindepth 1 -maxdepth 1 -type f -name 'list-h-n.*' -print | while read sfile; do

    # verify sbatch is non-empty
    #
    if [[ ! -s "$sfile" ]]; then
	RERUN=true
	if [[ -n $VERBOSE ]]; then
	    echo "$0: Notice: empty list-h-n file: $sfile" 1>&2
	    EXIT_CODE=2
	fi
    fi

    # obtain jobid
    #
    export JOB_ID=$(echo "$sfile" | sed -e 's/.*list-h-n\.//')
    if [[ -z "$JOB_ID" ]]; then
	echo "$0: Warning: ignoring list-h-n job id: $sfile" 1>&2
	EXIT_CODE=2
	continue
    fi
    export DIR=$(dirname "$sfile")
    if [[ -z "$DIR" ]]; then
	echo "$0: Warning: dirname is empty: $sfile" 1>&2
	EXIT_CODE=2
	continue
    fi
    export FILE=$(basename "$sfile")
    if [[ -z "$FILE" ]]; then
	echo "$0: Warning: filename is empty: $sfile" 1>&2
	EXIT_CODE=2
	continue
    fi
    export RERUN=

    # warn about missing sbatch file
    #
    if [[ ! -f "$DIR/sbatch.$JOB_ID.slurm" ]]; then
	echo "$0: Warning: missing sbatch file: $DIR/sbatch.$JOB_ID.slurm" 1>&2
	EXIT_CODE=2
    fi
done

# All Done!!! - Jessica Noll, Age 2
#
exit "$EXIT_CODE"
