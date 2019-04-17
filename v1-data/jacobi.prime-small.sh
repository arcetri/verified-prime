#!/bin/bash
#
# jacobi.prime-small.sh - tally Jacobi stats for verifed primes with n < 1000
#
# usage:
#	jacobi.prime-small.sh [-h]
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
export JACOBI_GENTALLY="./jacobi-gentally"
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
export RANGE_H_0MOD3="job.h-0mod3.prime-small"
export RANGE_H_NOT0MOD3="job.h-not0mod3.prime-small"

# firewall
#
if [[ ! -x $JACOBI_GENTALLY ]]; then
    echo "$0: FATAL: cannot find executable: $JACOBI_GENTALLY" 1>&2
    exit 2
fi
if [[ ! -d "$RANGE_H_0MOD3" ]]; then
    mkdir -p "$RANGE_H_0MOD3"
    if [[ ! -d "$RANGE_H_0MOD3" ]]; then
	echo "$0: FATAL: cannot form 0mod3 directory: $RANGE_H_0MOD3" 1>&2
	exit 3
    fi
fi
if [[ ! -d "$RANGE_H_NOT0MOD3" ]]; then
    mkdir -p "$RANGE_H_NOT0MOD3"
    if [[ ! -d "$RANGE_H_NOT0MOD3" ]]; then
	echo "$0: FATAL: cannot form not0mod3 directory: $RANGE_H_NOT0MOD3" 1>&2
	exit 4
    fi
fi

# jacobi-gentally processing for 0mod3
#
echo "$JACOBI_GENTALLY" -v 1 "$RANGE_H_0MOD3/tally.int" "$RANGE_H_0MOD3/tally.1stint" "$RANGE_H_0MOD3/tally.odd" "$RANGE_H_0MOD3/tally.1stodd" "$RANGE_H_0MOD3/tally.byfreq" "$RANGE_H_0MOD3/tally.byv1" "$RANGE_H_0MOD3/tally.byoddfreq" "$RANGE_H_0MOD3/tally.byoddv1"
find "$RANGE_H_0MOD3/" -type f -name 'jacobi.*' -print0 | xargs0 cat |
(
    "$JACOBI_GENTALLY" -v 1 "$RANGE_H_0MOD3/tally.int" "$RANGE_H_0MOD3/tally.1stint" "$RANGE_H_0MOD3/tally.odd" "$RANGE_H_0MOD3/tally.1stodd" "$RANGE_H_0MOD3/tally.byfreq" "$RANGE_H_0MOD3/tally.byv1" "$RANGE_H_0MOD3/tally.byoddfreq" "$RANGE_H_0MOD3/tally.byoddv1"
    status="$?"
    if [[ $status -ne 0 ]]; then
	echo "$0: Warning: $JACOBI_GENTALLY on $RANGE_H_0MOD3 non-zero exit status: $status" 1>&2
	exit 1
    fi
)

# jacobi-gentally processing for not0mod3
#
echo "$JACOBI_GENTALLY" -v 1 "$RANGE_H_NOT0MOD3/tally.int" "$RANGE_H_NOT0MOD3/tally.1stint" "$RANGE_H_NOT0MOD3/tally.odd" "$RANGE_H_NOT0MOD3/tally.1stodd" "$RANGE_H_NOT0MOD3/tally.byfreq" "$RANGE_H_NOT0MOD3/tally.byv1" "$RANGE_H_NOT0MOD3/tally.byoddfreq" "$RANGE_H_NOT0MOD3/tally.byoddv1"
find "$RANGE_H_NOT0MOD3/" -type f -name 'jacobi.*' -print0 | xargs0 cat |
(
    "$JACOBI_GENTALLY" -v 1 "$RANGE_H_NOT0MOD3/tally.int" "$RANGE_H_NOT0MOD3/tally.1stint" "$RANGE_H_NOT0MOD3/tally.odd" "$RANGE_H_NOT0MOD3/tally.1stodd" "$RANGE_H_NOT0MOD3/tally.byfreq" "$RANGE_H_NOT0MOD3/tally.byv1" "$RANGE_H_NOT0MOD3/tally.byoddfreq" "$RANGE_H_NOT0MOD3/tally.byoddv1"
    status="$?"
    if [[ $status -ne 0 ]]; then
	echo "$0: Warning: $JACOBI_GENTALLY on $RANGE_H_NOT0MOD3 non-zero exit status: $status" 1>&2
	exit 1
    fi
)
