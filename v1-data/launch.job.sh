#!/bin/bash
#
# launch.job.sh - launch SLURM jobs from a job directory
#
# usage:
#
#	launch.job.sh [-h] job.dir

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
USAGE="usage: $0 [-h] job.dir"
if [[ $# -ne 1 ]]; then
    echo "$0: FATAL: expected 1 arg" 1>&2
    echo $USAGE 1>&2
    exit 1
elif [[ $1 = "-h" ]]; then
    echo $USAGE 1>&2
    exit 0
fi
JOB_DIR="$1"

# firewall
#
if [[ ! -d "$JOB_DIR" ]]; then
    echo "$0: FATAL: missing directory: $JOB_DIR" 1>&2
    exit 2
fi
if [[ ! -x "$JOB_DIR/run.all.sh" ]]; then
    echo "$0: FATAL: missing executable: $JOB_DIR/run.all.sh" 1>&2
    exit 3
fi

# launch
#
echo "launching jobs for $JOB_DIR"
cd "$JOB_DIR"
/bin/bash "./run.all.sh"
exit $?
