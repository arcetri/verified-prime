#!/bin/bash
#
# jacobi.all.sh - tally Jacobi stats for all job directories
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
#
# IMPORTANT NOTE:
#
# Collecting data on v(1) for when h != 0 mod 3 is just for curosity.
# It is not important for developing a v(1) search stragety because
# when h != 0 mod 3, the optimal search strategy is:
#
#      3, 4
#
# While 40% of h*2^n-1 when h != 0 mod 3 will be satified with v(1) as 3,
# 100% of such numbers may use v(1) as 4.  We simply need to test if:
#
#      Jacobi(1, h*2^n-1) == 1
#      Jacobi(5, h*2^n-1) == -1
#
# then v(1) == 3 else v(1) == 4.

# setup
#
export JACOBI_PRIME_ALL_SH="./jacobi.prime-all.sh"
export JACOBI_PRIME_SMALL_SH="./jacobi.prime-small.sh"
export JACOBI_PRIME_LARGE_SH="./jacobi.prime-large.sh"
export JACOBI_TALLY_SH="./jacobi.tally.sh"
export JACOBI_BASELINE_SH="./jacobi.baseline.sh"
export JACOBI_JOBSETS_SH="./jacobi.jobsets.sh"

# parse args
#
export USAGE="usage: $0 [-h] [-s {0mod3|not0mod3}]

    -h		    print help and exit 0

    -s 0mod3	    skip processing the job direcory for h == 0mod3 (def: process)
    -s not0mod3	    skip processing the job direcory for h != 0mod3 (def: process)"
export PROCESS_0MOD3=true
export PROCESS_NOT_0MOD3=true
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
if [[ -n $SKIP_ARG ]]; then
    SKIP_ARG="-s $SKIP_ARG"
fi
echo "$0: starting $SKIP_ARG"
echo

# firewall
#
if [[ ! -x $JACOBI_TALLY_SH ]]; then
    echo "$0: FATAL: cannot find executable: $JACOBI_TALLY_SH" 1>&2
    exit 2
fi
if [[ ! -x $JACOBI_PRIME_ALL_SH ]]; then
    echo "$0: FATAL: cannot find executable: $JACOBI_PRIME_ALL_SH" 1>&2
    exit 3
fi
if [[ ! -x $JACOBI_PRIME_SMALL_SH ]]; then
    echo "$0: FATAL: cannot find executable: $JACOBI_PRIME_SMALL_SH" 1>&2
    exit 4
fi
if [[ ! -x $JACOBI_PRIME_LARGE_SH ]]; then
    echo "$0: FATAL: cannot find executable: $JACOBI_PRIME_LARGE_SH" 1>&2
    exit 5
fi

"$JACOBI_TALLY_SH" $SKIP_ARG 4194304
"$JACOBI_TALLY_SH" $SKIP_ARG 4331116
"$JACOBI_TALLY_SH" $SKIP_ARG 4885002
"$JACOBI_TALLY_SH" $SKIP_ARG 5209020
"$JACOBI_TALLY_SH" $SKIP_ARG 6286862
"$JACOBI_TALLY_SH" $SKIP_ARG 7676777
"$JACOBI_TALLY_SH" $SKIP_ARG 8388608
"$JACOBI_BASELINE_SH" $SKIP_ARG
"$JACOBI_TALLY_SH" $SKIP_ARG 1391827
"$JACOBI_TALLY_SH" $SKIP_ARG 3727058
"$JACOBI_TALLY_SH" $SKIP_ARG 5718259
"$JACOBI_TALLY_SH" $SKIP_ARG 12776050
"$JACOBI_TALLY_SH" $SKIP_ARG 23059373
"$JACOBI_TALLY_SH" $SKIP_ARG 56126460
"$JACOBI_TALLY_SH" $SKIP_ARG 132174368
"$JACOBI_JOBSETS_SH" $SKIP_ARG
"$JACOBI_PRIME_SMALL_SH" $SKIP_ARG
"$JACOBI_PRIME_LARGE_SH" $SKIP_ARG
"$JACOBI_PRIME_ALL_SH" $SKIP_ARG

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
