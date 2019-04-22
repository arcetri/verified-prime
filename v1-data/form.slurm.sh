#!/bin/bash
#
# form.slurm.sh - form a slurm job for generating jacboi +-0 strings
#
# See $USAGE below of usage.
#

# Copyright (C) 2019  Landon Curt Noll
#
# Calc is open software; you can redistribute it and/or modify it under
# the terms of the version 2.1 of the GNU Lesser General Public License
# as published by the Free Software Foundation.
#
# Calc is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
# Public License for more details.
#
# A copy of version 2.1 of the GNU Lesser General Public License is
# distributed with calc under the filename COPYING-LGPL.  You should have
# received a copy with calc; if not, write to Free Software Foundation, Inc.
# 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# chongo <was here> /\oo/\     http://www.isthe.com/chongo/
# Share and enjoy!  :-)        http://www.isthe.com/chongo/tech/comp/calc/

# setup
#
export DEF_MAX_V1=999	# must be same as DEF_MAX_V1 in jacobi-stat.h

# parse args
#
export USAGE="usage: $0 [-h] job_dir id len max > sbatch.xxxxx.slurm

    -h		print help and exit 0

    job_dir	path of job.* directory
    id		list-h-n job ID
    max		maximum Jacobi 1st term (we suggest: 256)"
export FORCE=
while getopts :h flag; do
    case "$flag" in
    h)  echo "$USAGE" 1>&2
	exit 0
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
if [[ $# -ne 3 ]]; then
    echo "$0: expected 3 args" 1>&2
    echo "$USAGE" 1>&2
    exit 1
fi
REAL_PATH=$(which realpath)
if [[ -z $REAL_PATH ]]; then
    echo "$0: cannot find command: realpath" 1>&2
    exit 2
fi
export JOB_DIR=$("$REAL_PATH" "$1")
export JOB_DIR_BASE=$(basename "$JOB_DIR")
export JOB_NAME="${JOB_DIR_BASE#job.}"
export ID="$2"
export MAX="$3"
if [[ ! $MAX =~ ^[0-9]+$ || $MAX -lt 5 ]]; then
    echo "$0: max must be an integer >= 5" 1>&2
    echo "$USAGE" 1>&2
    exit 3
fi
if [[ $MAX -gt $DEF_MAX_V1 ]]; then
    echo "$0: FATAL: Internal error: max arg: $MAX > DEF_MAX_V1: $DEF_MAX_V1" 1>&2
    echo "$0: FATAL: Internal error: DEF_MAX_V1 must match DEF_MAX_V1 in jacobi-stat.h" 1>&2
    echo "$0: FATAL: Internal error: max arg must not exceed $DEF_MAX_V1" 1>&2
    exit 4
fi

# firewall
#
export CALC_JOB=$("$REAL_PATH" "$PWD/jacobi-h-n.calc")
if [[ ! -x "$CALC_JOB" ]]; then
    echo "$0: FATAL: canot find executable: $CALC_JOB" 1>&2
    exit 5
fi

cat << EOF
#!/bin/bash
#
# sbatch.$ID.slurm - generate a jacboi +-0 string for from file list-h-n.$ID
#
# SLURM submission parameters
#
#SBATCH --job-name=$JOB_NAME	# name of this job
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-08:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.$ID		# stdout
#SBATCH --error=stderr.$ID		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "$JOB_DIR"
/usr/bin/time -o "time.$ID" "$CALC_JOB" "list-h-n.$ID" $MAX
EOF
