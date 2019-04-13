#!/bin/bash
#
# form.slurm.sh - form a slurm job for generating jacboi +-0 strings
#
# usage:
#
#	form.slurm.sh [-h] job_dir id > file.slurm
#
#	-h		print help and exit
#
#	job_dir		path of job.* directory
#	id		list-h-n job ID

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

# parse args
#
if [[ $# -gt 0 && "$1" == '-h' ]]; then
    echo "usage: $0 [-h] job_dir id" 1>&2
    exit 0
fi
if [[ $# -ne 2 ]]; then
    echo "$0: FATAL: requires 2 args" 1>&2
    echo "usage: $0 [-h] job_dir id" 1>&2
    exit 1
fi
export JOB_DIR=$(realpath "$1")
export JOB_DIR_BASE=$(basename "$JOB_DIR")
export JOB_NAME="${JOB_DIR_BASE#job.}"
export ID="$2"

# firewall
#
export CALC_JOB=$(realpath "$PWD/jacobi-h-n.calc")
if [[ ! -x "$CALC_JOB" ]]; then
    echo "$0: FATAL: canot find executable: $CALC_JOB" 1>&2
    exit 2
fi

cat << EOF
#!/bin/bash
#
# sbatch.$ID.slurm - generate a jacboi +-0 string for from file list-h-n.$ID
#
# SLURM submission parameters
#
#SBATCH --job-name=$JOB_NAME	# name of this job
#SBATCH --partition=arcetri_comp	# cluster partition to use
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-00:20:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.$ID		# stdout
#SBATCH --error=stderr.$ID		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "$JOB_DIR"
/usr/bin/time -o "time.$ID" "$CALC_JOB" "list-h-n.$ID" 167
EOF
