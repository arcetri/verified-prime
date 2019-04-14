#!/bin/bash
#
# jacobi.jobset.sh - tally Jacobi stats for all job directories
#
# usage:
#	jacobi.jobset.sh [-h]
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
export JACOBI_DATA1="./jacobi-data1"
export USAGE="usage: $0 [-h]"

# parse args
#
if [[ $1 == '-h' ]]; then
    echo $USAGE 1>&2
    exit 0
elif [[ $# -ne 0 ]]; then
    echo $USAGE 1>&2
    exit 1
fi
export BASE_N="$1"
export RANGE_H_0MOD3="job.h-0mod3.jobset"
export RANGE_H_NOT0MOD3="job.h-not0mod3.jobset"

# firewall
#
if [[ ! -x $JACOBI_DATA1 ]]; then
    echo "$0: FATAL: cannot find executable: $JACOBI_DATA1" 1>&2
    exit 2
fi
if [[ ! -d "$RANGE_H_0MOD3" ]]; then
    echo "$0: FATAL: missing 0mod3 directory: $RANGE_H_0MOD3" 1>&2
    exit 3
fi
if [[ ! -d "$RANGE_H_NOT0MOD3" ]]; then
    echo "$0: FATAL: missing not0mod3 directory: $RANGE_H_NOT0MOD3" 1>&2
    exit 4
fi

# jacobi-data1 processing for 0mod3
#
echo "$JACOBI_DATA1" -v 1 "$RANGE_H_0MOD3/tally.int" "$RANGE_H_0MOD3/tally.1stint" "$RANGE_H_0MOD3/tally.odd" "$RANGE_H_0MOD3/tally.1stodd"
find . -path '*/job.h-0mod3.*/jacobi.*' -print0 | xargs0 cat |
(
    "$JACOBI_DATA1" -v 1 "$RANGE_H_0MOD3/tally.int" "$RANGE_H_0MOD3/tally.1stint" "$RANGE_H_0MOD3/tally.odd" "$RANGE_H_0MOD3/tally.1stodd"
    status="$?"
    if [[ $status -ne 0 ]]; then
	echo "$0: Warning: $JACOBI_DATA1 on $RANGE_H_0MOD3 non-zero exit status: $status" 1>&2
	exit 1
    fi
)

# jacobi-data1 processing for not0mod3
#
echo "$JACOBI_DATA1" -v 1 "$RANGE_H_NOT0MOD3/tally.int" "$RANGE_H_NOT0MOD3/tally.1stint" "$RANGE_H_NOT0MOD3/tally.odd" "$RANGE_H_NOT0MOD3/tally.1stodd"
find . -path '*/job.h-0mod3.*/jacobi.*' -print0 | xargs0 cat |
(
    "$JACOBI_DATA1" -v 1 "$RANGE_H_NOT0MOD3/tally.int" "$RANGE_H_NOT0MOD3/tally.1stint" "$RANGE_H_NOT0MOD3/tally.odd" "$RANGE_H_NOT0MOD3/tally.1stodd"
    status="$?"
    if [[ $status -ne 0 ]]; then
	echo "$0: Warning: $JACOBI_DATA1 on $RANGE_H_NOT0MOD3 non-zero exit status: $status" 1>&2
	exit 1
    fi
)
