#!/bin/bash
#
# gen.primejob.sh - generate SLURM job input data for verified primes
#
# usage:
#	gen.primejob.sh

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
export PRIME_H_0MOD3="job.h-0mod3.prime"
export PRIME_H_NOT0MOD3="job.h-not0mod3.prime"
export GEN_H0MOD3_CALC="./h0mod3-n.calc"
export GEN_HNOT0MOD3_CALC="./hnot0mod3-n.calc"
export VERIFIED_PRIME_H_0MOD3="../h-0mod3-n.verified-prime.txt"
export VERIFIED_PRIME_H_NOT0MOD3="../h-not0mod3-n.verified-prime.txt"
export FORM_SLURM="form.slurm.sh"
export COUNT=1000

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
if [[ ! -r $VERIFIED_PRIME_H_0MOD3 ]]; then
    echo "$0: FATAL: not a readable file: $VERIFIED_PRIME_H_0MOD3" 1>&2
    exit 3
fi
if [[ ! -r $VERIFIED_PRIME_H_NOT0MOD3 ]]; then
    echo "$0: FATAL: not a readable file: $VERIFIED_PRIME_H_NOT0MOD3" 1>&2
    exit 4
fi
if [[ ! -x $FORM_SLURM ]]; then
    echo "$0: FATAL: cannot find executable: $FORM_SLURM" 1>&2
    exit 5
fi

# initialize the job directories
#
for dir in "$PRIME_H_0MOD3" "$PRIME_H_NOT0MOD3"; do

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
echo "generaring list-h-n files in $PRIME_H_0MOD3"
split --lines="$COUNT" --suffix-length=5 "$VERIFIED_PRIME_H_0MOD3" "$PRIME_H_0MOD3/list-h-n."
find "$PRIME_H_0MOD3" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
#
echo "generaring list-h-n files in $PRIME_H_NOT0MOD3"
split --lines="$COUNT" --suffix-length=5 "$VERIFIED_PRIME_H_NOT0MOD3" "$PRIME_H_NOT0MOD3/list-h-n."
find "$PRIME_H_NOT0MOD3" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444

# form slurm jobs for each directory
#
for dir in "$PRIME_H_0MOD3" "$PRIME_H_NOT0MOD3"; do

    # determine full path of directory
    #
    export FULL_PATH=$(realpath "$dir")

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
done
