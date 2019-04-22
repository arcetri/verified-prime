#!/usr/bin/bash -
#
# start-all-slurm-jobs - start all slurm jobs
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
export WAIT_UNTIL_LE_JOBCOUNT_SH="./wait-until-le-jobcount.sh"
export LAUNCH_JOB_SH="./launch.job.sh"

# parse args
#
export SECS=60
export USAGE="usage: $0 [-h] [-f] [-s {0mod3|not0mod3}] [-w secs] [-v] min_count

    -h		print help and exit 0

    -f		force launching jobs in dir where jobs previous ran (def: don't run)

    -s 0mod3	    skip processing the job direcory for h == 0mod3 (def: process)
    -s not0mod3	    skip processing the job direcory for h != 0mod3 (def: process)

    -w secs	wait secs between job count checking (def: $SECS)
    -v		be verhose while waiting

    min_count	wait until user has <= min_count jobs queued"
export FORCE=
export SECS=60
export VERBOSE=
export PROCESS_0MOD3=true
export PROCESS_NOT_0MOD3=true
export SKIP_ARG=
while getopts :hfs:w:v flag; do
    case "$flag" in
    h)  echo "$USAGE" 1>&2
	exit 0
	;;
    f)  FORCE="-f"
	;;
    s)  SKIP_ARG="$OPTARG"
	case "$SKIP_ARG" in
	0mod3) PROCESS_0MOD3= ;;
	not0mod3) PROCESS_NOT_0MOD3= ;;
	*)  echo "$0: FATAL: -s arg must be either 0mod3 or not0mod3" 1>&2
	    echo "$USAGE" 1>&2
	    exit 1
	    ;;
	esac
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
    if [[ -n $FORCE ]]; then
	echo "$0: Notice: force launching jobs in dir where jobs previous ran"
    fi
    if [[ -z $PROCESS_0MOD3 ]]; then
	echo "$0: Notice: skipping job direcories for h == 0mod3"
    fi
    if [[ -z $PROCESS_NOT_0MOD3 ]]; then
	echo "$0: Notice: skipping job direcories for h != 0mod3"
    fi
    echo "$0: Notice: waiting until <= $MIN_COUNT jobs"
    echo "$0: Notice: waiting up to $SECS secs between checks"
fi

# determine our list of job dirs
#
export JOB_DIRS=
if [[ -n $PROCESS_0MOD3 ]]; then
    JOB_DIRS="$JOB_DIRS baseline/job.h-0mod3.n-4194304"
    JOB_DIRS="$JOB_DIRS baseline/job.h-0mod3.n-4331116"
    JOB_DIRS="$JOB_DIRS baseline/job.h-0mod3.n-4885002"
    JOB_DIRS="$JOB_DIRS baseline/job.h-0mod3.n-5209020"
    JOB_DIRS="$JOB_DIRS baseline/job.h-0mod3.n-6286862"
    JOB_DIRS="$JOB_DIRS baseline/job.h-0mod3.n-7676777"
    JOB_DIRS="$JOB_DIRS baseline/job.h-0mod3.n-8388608"
fi
if [[ -n $PROCESS_0MOD3 ]]; then
    JOB_DIRS="$JOB_DIRS job.h-0mod3.n-1391827"
    JOB_DIRS="$JOB_DIRS job.h-0mod3.n-3727058"
    JOB_DIRS="$JOB_DIRS job.h-0mod3.n-5718259"
    JOB_DIRS="$JOB_DIRS job.h-0mod3.n-12776050"
    JOB_DIRS="$JOB_DIRS job.h-0mod3.n-23059373"
    JOB_DIRS="$JOB_DIRS job.h-0mod3.n-56126460"
    JOB_DIRS="$JOB_DIRS job.h-0mod3.n-132174368"
fi
if [[ -n $PROCESS_0MOD3 ]]; then
    JOB_DIRS="$JOB_DIRS job.h-0mod3.prime-small"
    JOB_DIRS="$JOB_DIRS job.h-0mod3.prime-large"
    JOB_DIRS="$JOB_DIRS job.h-0mod3.prime-all"
fi
if [[ -n $PROCESS_NOT_0MOD3 ]]; then
    JOB_DIRS="$JOB_DIRS baseline/job.h-not0mod3.n-4194304"
    JOB_DIRS="$JOB_DIRS baseline/job.h-not0mod3.n-4331116"
    JOB_DIRS="$JOB_DIRS baseline/job.h-not0mod3.n-4885002"
    JOB_DIRS="$JOB_DIRS baseline/job.h-not0mod3.n-5209020"
    JOB_DIRS="$JOB_DIRS baseline/job.h-not0mod3.n-6286862"
    JOB_DIRS="$JOB_DIRS baseline/job.h-not0mod3.n-7676777"
    JOB_DIRS="$JOB_DIRS baseline/job.h-not0mod3.n-8388608"
fi
if [[ -n $PROCESS_NOT_0MOD3 ]]; then
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.n-1391827"
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.n-3727058"
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.n-5718259"
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.n-12776050"
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.n-23059373"
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.n-56126460"
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.n-132174368"
fi
if [[ -n $PROCESS_NOT_0MOD3 ]]; then
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.prime-small"
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.prime-large"
    JOB_DIRS="$JOB_DIRS job.h-not0mod3.prime-all"
fi

# firewall
#
if [[ ! -x $WAIT_UNTIL_LE_JOBCOUNT_SH ]]; then
    echo "$0: FATAL: cannot find the executable: $WAIT_UNTIL_LE_JOBCOUNT_SH" 1>&2
    exit 3
fi
if [[ ! -x $LAUNCH_JOB_SH ]]; then
    echo "$0: FATAL: cannot find the executable: $LAUNCH_JOB_SH" 1>&2
    exit 4
fi
if [[ -z $JOB_DIRS ]]; then
    echo "$0: FATAL: found no job directies to process" 1>&2
    exit 5
fi

# verify we can launch in our set of job directories
#
export JOB_ID=
for jobdir in $JOB_DIRS; do

    # verify that our critical job content exists and is non-empty
    #
    if [[ -n $VERBOSE ]]; then
	echo "$0: Notice: verify we can launch from: $jobdir"
    fi
    if [[ ! -d $jobdir ]]; then
	echo "$0: FATAL: missing job directory: $jobdir" 1>&2
	exit 6
    fi
    if [[ ! -x $jobdir/run.all.sh || ! -s $jobdir/run.all.sh ]]; then
	echo "$0: FATAL: missing non-empty exeutable: $jobdir/run.all.sh" 1>&2
	exit 7
    fi
    SBATCH_FILE_COUNT=$(find "$jobdir" -mindepth 1 -maxdepth 1 -type f \
			-name 'sbatch.*.slurm' ! -size 0 -print 2>/dev/null 2>/dev/null | wc -l)
    if [[ -z $SBATCH_FILE_COUNT || $SBATCH_FILE_COUNT -le 0 ]]; then
	echo "$0: FATAL: found no non-empty sbatch files under: $jobdir" 1>&2
	exit 8
    fi
    LIST_FILE_COUNT=$(find "$jobdir" -mindepth 1 -maxdepth 1 -type f \
		      -name 'list-h-n.*' ! -size 0 -print 2>/dev/null 2>/dev/null | wc -l)
    if [[ -z $LIST_FILE_COUNT || $LIST_FILE_COUNT -le 0 ]]; then
	echo "$0: FATAL: found no non-empty list-h-n files under: $jobdir" 1>&2
	exit 9
    fi
    if [[ $SBATCH_FILE_COUNT -ne $LIST_FILE_COUNT ]]; then
	echo "$0: FATAL: sbatch file count: $SBATCH_FILE_COUNT != list-h-n found count: $LIST_FILE_COUNT" 1>&2
	exit 10
    fi
    find "$jobdir" -mindepth 1 -maxdepth 1 -type f -name 'sbatch.*.slurm' -print | while read sfile; do
	JOB_ID=$(echo "$sfile" | sed -e 's/.*sbatch\.//' -e 's/\.slurm//')
	if [[ ! -f "$jobdir/list-h-n.$JOB_ID" ]]; then
	    echo "$0: FATAL: missing list-h-n file: $jobdir/list-h-n.$JOB_ID" 1>&2
	    exit 11
	fi
    done

    # verify we do not have jacobi files from a previous run
    #
    if [[ -n $FORCE ]]; then
	find "$jobdir" -mindepth 1 -maxdepth 1 -type f -name 'jacobi.*' -delete
    fi
    JACOBI_FILE_COUNT=$(find "$jobdir" -mindepth 1 -maxdepth 1 -type f \
			-name 'jacobi.*' -print 2>/dev/null 2>/dev/null | wc -l)
    if [[ -z $JACOBI_FILE_COUNT || $JACOBI_FILE_COUNT -ne 0 ]]; then
	echo "$0: FATAL: found jacobi files under: $jobdir" 1>&2
	exit 12
    fi

    # verify we do not have stderr files from a previous run
    #
    if [[ -n $FORCE ]]; then
	find "$jobdir" -mindepth 1 -maxdepth 1 -type f -name 'stderr.*' -delete
    fi
    STDERR_FILE_COUNT=$(find "$jobdir" -mindepth 1 -maxdepth 1 -type f \
			-name 'stderr.*' -print 2>/dev/null 2>/dev/null | wc -l)
    if [[ -z $STDERR_FILE_COUNT || $STDERR_FILE_COUNT -ne 0 ]]; then
	echo "$0: FATAL: found stderr files under: $jobdir" 1>&2
	exit 13
    fi

    # verify we do not have time files from a previous run
    #
    if [[ -n $FORCE ]]; then
	find "$jobdir" -mindepth 1 -maxdepth 1 -type f -name 'time.*' -delete
    fi
    TIME_FILE_COUNT=$(find "$jobdir" -mindepth 1 -maxdepth 1 -type f \
		      -name 'time.*' -print 2>/dev/null 2>/dev/null | wc -l)
    if [[ -z $TIME_FILE_COUNT || $TIME_FILE_COUNT -ne 0 ]]; then
	echo "$0: FATAL: found time files under: $jobdir" 1>&2
	exit 14
    fi
done
if [[ -n $VERBOSE ]]; then
    echo
fi

# launch all jobs in our job directory set
#
for jobdir in $JOB_DIRS; do

    # report if vernose
    #
    if [[ -n $VERBOSE ]]; then
	echo "$0: Notice: $(date) about to launch jobs for: $jobdir"
	echo
    fi

    # wait until we do not have too many jobs in the queue
    #
    "$WAIT_UNTIL_LE_JOBCOUNT_SH" -w "$SECS" $VERBOSE "$MIN_COUNT"
    status=$?
    if [[ $status -ne 0 ]]; then
	echo "$0: Warning: $WAIT_UNTIL_LE_JOBCOUNT_SH non-zero exit code: $status" 1>&2
    fi
    if [[ -n $VERBOSE ]]; then
	echo
    fi

    # launch jobs
    #
    "$LAUNCH_JOB_SH" "$jobdir"
    status=$?
    if [[ $status -ne 0 ]]; then
	echo "$0: Warning: $LAUNCH_JOB_SH $jobdir non-zero exit code: $status" 1>&2
    fi
    if [[ -n $VERBOSE ]]; then
	echo "$0: Notice: $(date) launched jobs for: $jobdir"
	echo
    fi
done

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
