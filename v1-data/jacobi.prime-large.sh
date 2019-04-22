#!/bin/bash
#
# jacobi.prime-large.sh - tally Jacobi stats for verifed primes with n < 1000
#
# See $USAGE below of usage.

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

# parse args
#
export USAGE="usage: $0 [-h] [-s {0mod3|not0mod3}]

    -h		    print help and exit 0

    -s 0mod3	    skip processing the job direcory for h == 0mod3 (def: process)
    -s not0mod3	    skip processing the job direcory for h != 0mod3 (def: process)"
export PROCESS_0MOD3=true
export PROCESS_NOT_0MOD3=true
export SKIP_ARG=
while getopts :hs: flag; do
    case "$flag" in
    h)  echo "$USAGE" 1>&2
	exit 0
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
if [[ $# -ne 0 ]]; then
    echo "$0: expected 0 args" 1>&2
    echo "$USAGE" 1>&2
    exit 1
fi
export RANGE_H_0MOD3="job.h-0mod3.prime-large"
export RANGE_H_NOT0MOD3="job.h-not0mod3.prime-large"
if [[ -n $SKIP_ARG ]]; then
    SKIP_ARG="-s $SKIP_ARG"
fi
echo "$0: starting $SKIP_ARG"
echo
if [[ -n $PROCESS_0MOD3 ]]; then
    echo "$0: 0mod3 $RANGE_H_0MOD3"
fi
if [[ -n $PROCESS_NOT_0MOD3 ]]; then
    echo "$0: not0mod3 $RANGE_H_NOT0MOD3"
fi
echo

# firewall
#
if [[ ! -x $JACOBI_GENTALLY ]]; then
    echo "$0: FATAL: cannot find executable: $JACOBI_GENTALLY" 1>&2
    exit 2
fi
if [[ -n $PROCESS_0MOD3 ]]; then
    if [[ ! -d "$RANGE_H_0MOD3" ]]; then
	mkdir -p "$RANGE_H_0MOD3"
	if [[ ! -d "$RANGE_H_0MOD3" ]]; then
	    echo "$0: FATAL: cannot form 0mod3 directory: $RANGE_H_0MOD3" 1>&2
	    exit 3
	fi
    fi
fi
if [[ -n $PROCESS_NOT_0MOD3 ]]; then
    if [[ ! -d "$RANGE_H_NOT0MOD3" ]]; then
	mkdir -p "$RANGE_H_NOT0MOD3"
	if [[ ! -d "$RANGE_H_NOT0MOD3" ]]; then
	    echo "$0: FATAL: cannot form not0mod3 directory: $RANGE_H_NOT0MOD3" 1>&2
	    exit 4
	fi
    fi
fi

# jacobi-gentally processing for 0mod3
#
if [[ -n $PROCESS_0MOD3 ]]; then
    echo "$JACOBI_GENTALLY" -v 3 "$RANGE_H_0MOD3/global.stats" "$RANGE_H_0MOD3/tally.int" "$RANGE_H_0MOD3/tally.1stint" "$RANGE_H_0MOD3/tally.odd" "$RANGE_H_0MOD3/tally.1stodd" "$RANGE_H_0MOD3/tally.byfreq" "$RANGE_H_0MOD3/tally.byv1" "$RANGE_H_0MOD3/tally.byoddfreq" "$RANGE_H_0MOD3/tally.byoddv1" "$RANGE_H_0MOD3/tally.prime"
    find "$RANGE_H_0MOD3/" -type f -name 'jacobi.*' -print0 | xargs0 cat |
    (
	"$JACOBI_GENTALLY" -v 3 "$RANGE_H_0MOD3/global.stats" "$RANGE_H_0MOD3/tally.int" "$RANGE_H_0MOD3/tally.1stint" "$RANGE_H_0MOD3/tally.odd" "$RANGE_H_0MOD3/tally.1stodd" "$RANGE_H_0MOD3/tally.byfreq" "$RANGE_H_0MOD3/tally.byv1" "$RANGE_H_0MOD3/tally.byoddfreq" "$RANGE_H_0MOD3/tally.byoddv1" "$RANGE_H_0MOD3/tally.prime"
	status="$?"
	if [[ $status -ne 0 ]]; then
	    echo "$0: Warning: $JACOBI_GENTALLY on $RANGE_H_0MOD3 non-zero exit status: $status" 1>&2
	    exit 1
	fi
    )
    echo
fi

# jacobi-gentally processing for not0mod3
#
if [[ -n $PROCESS_NOT_0MOD3 ]]; then
    echo "$JACOBI_GENTALLY" -v 3 "$RANGE_H_NOT0MOD3/global.stats" "$RANGE_H_NOT0MOD3/tally.int" "$RANGE_H_NOT0MOD3/tally.1stint" "$RANGE_H_NOT0MOD3/tally.odd" "$RANGE_H_NOT0MOD3/tally.1stodd" "$RANGE_H_NOT0MOD3/tally.byfreq" "$RANGE_H_NOT0MOD3/tally.byv1" "$RANGE_H_NOT0MOD3/tally.byoddfreq" "$RANGE_H_NOT0MOD3/tally.byoddv1" "$RANGE_H_NOT0MOD3/tally.prime"
    find "$RANGE_H_NOT0MOD3/" -type f -name 'jacobi.*' -print0 | xargs0 cat |
    (
	"$JACOBI_GENTALLY" -v 3 "$RANGE_H_NOT0MOD3/global.stats" "$RANGE_H_NOT0MOD3/tally.int" "$RANGE_H_NOT0MOD3/tally.1stint" "$RANGE_H_NOT0MOD3/tally.odd" "$RANGE_H_NOT0MOD3/tally.1stodd" "$RANGE_H_NOT0MOD3/tally.byfreq" "$RANGE_H_NOT0MOD3/tally.byv1" "$RANGE_H_NOT0MOD3/tally.byoddfreq" "$RANGE_H_NOT0MOD3/tally.byoddv1" "$RANGE_H_NOT0MOD3/tally.prime"
	status="$?"
	if [[ $status -ne 0 ]]; then
	    echo "$0: Warning: $JACOBI_GENTALLY on $RANGE_H_NOT0MOD3 non-zero exit status: $status" 1>&2
	    exit 1
	fi
    )
    echo
fi

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
