#!/bin/bash
#
# gen.prime-small.sh - generate SLURM job input data for small verified primes
#
# A small verified prime is a prime of the form h*2^n-1 where n < 1000.
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
export RANGE_H_0MOD3="job.h-0mod3.prime-small"
export RANGE_H_NOT0MOD3="job.h-not0mod3.prime-small"
export GEN_H0MOD3_CALC="./h0mod3-n.calc"
export GEN_HNOT0MOD3_CALC="./hnot0mod3-n.calc"
export VERIFIED_RANGE_H_0MOD3="../h-0mod3-n.verified-prime-small.txt"
export VERIFIED_RANGE_H_NOT0MOD3="../h-not0mod3-n.verified-prime-small.txt"
export FORM_SLURM="form.slurm.sh"
export COUNT=1000

# parse args
#
export BASELINE=
export BASE_N=
export COUNT="1000"
USAGE="usage: $0 [-h]

    -h		print help and exit 0"
while getopts :h flag; do
    case "$flag" in
    h) echo "$USAGE" 1>&2
       exit 0 ;;
    \?) echo "$0: invalid option: -$OPTARG" 1>&2
       echo "$USAGE" 1>&2
       exit 1
       ;;
    :) echo "$0: option -$OPTARG requires an argument" 1>&2
       echo "$USAGE" 1>&2
       exit 1
       ;;
    esac
done
shift $(( OPTIND - 1 ));
if [[ $# -ne 0 ]]; then
    echo "$0: expected 0 args" 1>&2
    exit 1
fi

# firewall
#
if [[ ! -x $GEN_H0MOD3_CALC ]]; then
    echo "$0: FATAL: cannot find executable: $GEN_H0MOD3_CALC" 1>&2
    exit 1
fi
if [[ ! -x $GEN_HNOT0MOD3_CALC ]]; then
    echo "$0: FATAL: cannot find executable: $GEN_HNOT0MOD3_CALC" 1>&2
    exit 2
fi
if [[ ! -r $VERIFIED_RANGE_H_0MOD3 ]]; then
    echo "$0: FATAL: not a readable file: $VERIFIED_RANGE_H_0MOD3" 1>&2
    exit 3
fi
if [[ ! -r $VERIFIED_RANGE_H_NOT0MOD3 ]]; then
    echo "$0: FATAL: not a readable file: $VERIFIED_RANGE_H_NOT0MOD3" 1>&2
    exit 4
fi
if [[ ! -x $FORM_SLURM ]]; then
    echo "$0: FATAL: cannot find executable: $FORM_SLURM" 1>&2
    exit 5
fi
if [[ -z "$RANGE_H_0MOD3" ]]; then
    echo "$0: FATAL: Internal error: "'$'"RANGE_H_0MOD3 is empty" 1>&2
    exit 6
elif [[ -e "$RANGE_H_0MOD3" ]]; then
    echo "$0: FATAL: already exists: $RANGE_H_0MOD3" 1>&2
    exit 7
fi
if [[ -z "$RANGE_H_NOT0MOD3" ]]; then
    echo "$0: FATAL: Internal error: "'$'"RANGE_H_NOT0MOD3 is empty" 1>&2
    exit 8
elif [[ -e "$RANGE_H_NOT0MOD3" ]]; then
    echo "$0: FATAL: already exists: $RANGE_H_NOT0MOD3" 1>&2
    exit 9
fi
export REAL_PATH=$(which realpath)
if [[ -z $REAL_PATH ]]; then
    echo "$0: cannot find command: realpath" 1>&2
    exit 10
fi

# initialize the job directories
#
echo "$0: initialize the job directories"
mkdir -p -m 0755 "$RANGE_H_0MOD3"
mkdir -p -m 0755 "$RANGE_H_NOT0MOD3"
ls -ld "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3"
echo

# foreach directory, generate lists of h n files that are similar in length
#
echo "generaring list-h-n files in $RANGE_H_0MOD3"
split -l "$COUNT" -a 5 "$VERIFIED_RANGE_H_0MOD3" "$RANGE_H_0MOD3/list-h-n."
find "$RANGE_H_0MOD3/" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
echo
#
echo "generaring list-h-n files in $RANGE_H_NOT0MOD3"
split -l "$COUNT" -a 5 "$VERIFIED_RANGE_H_NOT0MOD3" "$RANGE_H_NOT0MOD3/list-h-n."
find "$RANGE_H_NOT0MOD3/" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
echo

# form slurm jobs for each directory
#
for dir in "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3"; do

    # determine full path of directory
    #
    export FULL_PATH=$("$REAL_PATH" "$dir")

    # start the run.all.sh file
    #
    echo "#!/bin/bash" > "$dir/run.all.sh"
    echo "#" >> "$dir/run.all.sh"
    echo "# run.all.sh - run all slurm jobs for $dir" >> "$dir/run.all.sh"
    echo "#" >> "$dir/run.all.sh"
    echo "cd $FULL_PATH" >> "$dir/run.all.sh"
    chmod 0755 "$dir/run.all.sh"

    # process this directory
    #
    echo "generaring sbatch slurm jobs for $dir"
    find "$dir" -mindepth 1 -maxdepth 1 -type f -name 'list-h-n.*' -print | while read file; do

	# determine the job ID
	#
	ID=$(basename "$file" | sed -e 's/list-h-n.//')

	# generate the slrum file
	#
	/bin/bash "$FORM_SLURM" "$dir" "$ID" > "$dir/sbatch.$ID.slurm"
	chmod 0444 "$dir/sbatch.$ID.slurm"

	# add to the run.all.sh file
	#
	echo "sbatch sbatch.$ID.slurm" >> "$dir/run.all.sh"
    done
    chmod 0555 "$dir/run.all.sh"
    echo
done
