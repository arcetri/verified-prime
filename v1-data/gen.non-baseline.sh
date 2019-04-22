#!/bin/bash
#
# gen.non-baseline.sh - generate non-baseline job directories

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
export GEN_JOB_SH="./gen.job.sh"
export GEN_PRIME_SMALL_SH="./gen.prime-small.sh"
export GEN_PRIME_LARGE_SH="./gen.prime-large.sh"
export GEN_PRIME_ALL_SH="./gen.prime-all.sh"

# parse args
#
export USAGE="usage: $0 [-h] [-f]

    -h		print help and exit 0

    -f		force generation even when dir exists (def: abort if dir exists)"
export FORCE=
while getopts :hf flag; do
    case "$flag" in
    h)  echo "$USAGE" 1>&2
	exit 0
	;;
    f)  FORCE="-f"
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
echo "$0: starting $FORCE"
echo

# firewall
#
if [[ ! -x $GEN_JOB_SH ]]; then
    echo "$0: cannot find executable: $GEN_JOB_SH" 1>&2
    exit 2
fi
if [[ ! -x $GEN_PRIME_SMALL_SH ]]; then
    echo "$0: cannot find executable: $GEN_PRIME_SMALL_SH" 1>&2
    exit 3
fi
if [[ ! -x $GEN_PRIME_LARGE_SH ]]; then
    echo "$0: cannot find executable: $GEN_PRIME_LARGE_SH" 1>&2
    exit 4
fi
if [[ ! -x $GEN_PRIME_ALL_SH ]]; then
    echo "$0: cannot find executable: $GEN_PRIME_ALL_SH" 1>&2
    exit 5
fi

# run gen.job.sh for our set of n values
#
"$GEN_JOB_SH" $FORCE 1391827
"$GEN_JOB_SH" $FORCE 3727058
"$GEN_JOB_SH" $FORCE 5718259
"$GEN_JOB_SH" $FORCE 12776050
"$GEN_JOB_SH" $FORCE 23059373
"$GEN_JOB_SH" $FORCE 56126460
"$GEN_JOB_SH" $FORCE 132174368
"$GEN_PRIME_SMALL_SH" $FORCE
"$GEN_PRIME_LARGE_SH" $FORCE
"$GEN_PRIME_ALL_SH" $FORCE

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
