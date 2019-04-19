#!/bin/bash
#
# jacobi.all.sh - tally Jacobi stats for all job directories
#
# usage:
#	jacobi.all.sh [-h]

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
export JACOBI_PRIME_ALL_SH="./jacobi.prime-all.sh"
export JACOBI_PRIME_SMALL_SH="./jacobi.prime-small.sh"
export JACOBI_PRIME_LARGE_SH="./jacobi.prime-large.sh"
export JACOBI_TALLY_SH="./jacobi.tally.sh"
export JACOBI_BASELINE_SH="./jacobi.baseline.sh"
export JACOBI_JOBSETS_SH="./jacobi.jobsets.sh"
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

"$JACOBI_TALLY_SH" 4194304
"$JACOBI_TALLY_SH" 4331116
"$JACOBI_TALLY_SH" 4885002
"$JACOBI_TALLY_SH" 5209020
"$JACOBI_TALLY_SH" 6286862
"$JACOBI_TALLY_SH" 7676777
"$JACOBI_TALLY_SH" 8388608
"$JACOBI_BASELINE_SH"
"$JACOBI_TALLY_SH" 1391827
"$JACOBI_TALLY_SH" 3727058
"$JACOBI_TALLY_SH" 5718259
"$JACOBI_TALLY_SH" 12776050
"$JACOBI_TALLY_SH" 23059373
"$JACOBI_TALLY_SH" 56126460
"$JACOBI_TALLY_SH" 132174368
"$JACOBI_JOBSETS_SH"
"$JACOBI_PRIME_SMALL_SH"
"$JACOBI_PRIME_LARGE_SH"
"$JACOBI_PRIME_ALL_SH"
