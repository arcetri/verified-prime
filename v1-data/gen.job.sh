#!/bin/bash
#
# gen.job.sh - generate SLURM job directories and input data files
#
# usage:
#	gen.job.sh [base_n [count]]
#
#	base_n		base value for n (def: 4331116)
#	count		range for n [range_n, range_n+count-1] (def: 1000)

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
export GEN_H0MOD3_CALC="./h0mod3-n.calc"
export GEN_HNOT0MOD3_CALC="./hnot0mod3-n.calc"
export FORM_SLURM="form.slurm.sh"

# parse args
#
export BASE_N="4331116"
export COUNT="1000"
USAGE="usage: $0 [-h] [base_n [count]]"
case "$#" in
0) ;;
1) if [[ $1 == '-h' ]]; then echo $USAGE 1>&2; exit 0; fi
   BASE_N="$1" ;;
2) if [[ $1 == '-h' ]]; then echo $USAGE 1>&2; exit 0; fi
   BASE_N="$1"; COUNT="$2" ;;
*) echo $USAGE 1>&2
   exit 1 ;;
esac
export RANGE_H_0MOD3="job.h-0mod3.n-$BASE_N"
export RANGE_H_NOT0MOD3="job.h-not0mod3.n-$BASE_N"

# firewall
#
if [[ ! -x $GEN_H0MOD3_CALC ]]; then
    echo "$0: FATAL: cannot find executable: $GEN_H0MOD3_CALC" 1>&2
    exit 2
fi
if [[ ! -x $GEN_HNOT0MOD3_CALC ]]; then
    echo "$0: FATAL: cannot find executable: $GEN_HNOT0MOD3_CALC" 1>&2
    exit 3
fi
if [[ ! -x $FORM_SLURM ]]; then
    echo "$0: FATAL: cannot find executable: $FORM_SLURM" 1>&2
    exit 4
fi

# initialize the job directories
#
for dir in "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3"; do

    # firewall - do not override
    #
    if [[ -d "$dir" ]]; then
	echo "$0: FATAL: job directory exists: $dir" 1>&2
	exit 5
    fi

    # make the directory
    #
    echo "forming directory $dir"
    mkdir -p "$dir"
    if [[ ! -d "$dir" ]]; then
	echo "$0: FATAL: cannot mkdir: $dir" 1>&2
	exit 5
    fi

    # clean out job files in the directory
    #
    # NOTE: code not needed if firewall - do not override stops override
    #
    chmod 0755 "$dir"
    echo "cleaning directory $dir"
    find "$dir" -type f -name 'list-h-n.*' -delete
    find "$dir" -type f -name 'sbatch.*' -delete
    find "$dir" -type f -name 'jacobi.*' -delete
    find "$dir" -type f -name 'stderr.*' -delete
    find "$dir" -type f -name 'time.*' -delete
    find "$dir" -type f -name 'run.all.sh' -delete
done

# foreach directory, generate lists of h n files that are similar in length
#
echo "generaring list-h-n files in $RANGE_H_0MOD3"
"$GEN_H0MOD3_CALC" "$BASE_N" "$COUNT" | split --lines="$COUNT" --suffix-length=5 - "$RANGE_H_0MOD3/list-h-n."
find "$RANGE_H_0MOD3" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
#
echo "generaring list-h-n files in $RANGE_H_NOT0MOD3"
"$GEN_HNOT0MOD3_CALC" "$BASE_N" "$COUNT" | split --lines="$COUNT" --suffix-length=5 - "$RANGE_H_NOT0MOD3/list-h-n."
find "$RANGE_H_NOT0MOD3" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444

# form slurm jobs for each directory
#
for dir in "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3"; do

    # determine full path of directory
    #
    export FULL_PATH=$(realpath "$dir")

    # determine the type
    #
    TYPE=$(basename "$dir" | sed -e 's/job.//')

    # start the run.all.sh file
    #
    echo "#!/bin/bash" > "$dir/run.all.sh"
    echo "#" >> "$dir/run.all.sh"
    echo "# run.all.sh - run all slurm jobs for $TYPE" >> "$dir/run.all.sh"
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
done
