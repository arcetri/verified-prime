#!/bin/bash
#
# gen.job.sh - generate SLURM job directories and input data files
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
export GEN_H0MOD3_CALC="./h0mod3-n.calc"
export GEN_HNOT0MOD3_CALC="./hnot0mod3-n.calc"
export FORM_SLURM="form.slurm.sh"

# parse args
#
export BASELINE=
export BASE_N=
export COUNT="1000"
USAGE="usage: $0 [-h] [-b] base_n [count]

    -h		print help and exit 0

    -b		create job dir under baseline and symlink under . (def: create job dir under . only)

    base_n	base n value, forms job.h-0mod3.n-base_n and job.h-not0mod3.n-base_n
    count	form n values over the half open interval [base_n, base_n+count) (def: 1000)"
while getopts :hb flag; do
    case "$flag" in
    h) echo "$USAGE" 1>&2
       exit 0 ;;
    b) BASELINE=true
       ;;
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
case "$#" in
1) BASE_N="$1" ;;
2) BASE_N="$1"; COUNT="$2" ;;
*) echo "$0: expected 1 or 2 args" 1>&2
   echo "$USAGE" 1>&2
   exit 1 ;;
esac
if [[ ! $BASE_N =~ ^[0-9]+$ || $BASE_N -lt 1 ]]; then
    echo "$0: base_n must be an integer > 0" 1>&2
    exit 1
fi
export SYMLINK_RANGE_H_0MOD3=
export SYMLINK_RANGE_H_NOT0MOD3=
export RANGE_H_0MOD3=
export RANGE_H_NOT0MOD3=
if [[ -n "$BASELINE" ]]; then
    export RANGE_H_0MOD3="baseline/job.h-0mod3.n-$BASE_N"
    export RANGE_H_NOT0MOD3="baseline/job.h-not0mod3.n-$BASE_N"
    export SYMLINK_RANGE_H_0MOD3="job.h-0mod3.n-$BASE_N"
    export SYMLINK_RANGE_H_NOT0MOD3="job.h-not0mod3.n-$BASE_N"
    if [[ ! -d baseline ]]; then
	mkdir -p baseline
	if [[ ! -d baseline ]]; then
	    echo "$0: unable to form baseline sub-directory" 1>&2
	    exit 2
	fi
    fi
else
    export RANGE_H_0MOD3="job.h-0mod3.n-$BASE_N"
    export RANGE_H_NOT0MOD3="job.h-not0mod3.n-$BASE_N"
fi

# firewall
#
if [[ ! -x $GEN_H0MOD3_CALC ]]; then
    echo "$0: FATAL: cannot find executable: $GEN_H0MOD3_CALC" 1>&2
    exit 3
fi
if [[ ! -x $GEN_HNOT0MOD3_CALC ]]; then
    echo "$0: FATAL: cannot find executable: $GEN_HNOT0MOD3_CALC" 1>&2
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
if [[ -n "$BASELINE" ]]; then
    if [[ -z $SYMLINK_RANGE_H_0MOD3 ]]; then
	echo "$0: FATAL: Internal error: "'$'"SYMLINK_RANGE_H_0MOD3 is empty" 1>&2
	exit 10
    elif [[ -e $SYMLINK_RANGE_H_0MOD3 ]]; then
	echo "$0: FATAL: already exists: $SYMLINK_RANGE_H_0MOD3" 1>&2
	exit 11
    fi
    if [[ -z $SYMLINK_RANGE_H_NOT0MOD3 ]]; then
	echo "$0: FATAL: Internal error: "'$'"SYMLINK_RANGE_H_NOT0MOD3 is empty" 1>&2
	exit 12
    elif [[ -e $SYMLINK_RANGE_H_NOT0MOD3 ]]; then
	echo "$0: FATAL: already exists: $SYMLINK_RANGE_H_NOT0MOD3" 1>&2
	exit 13
    fi
fi
export REAL_PATH=$(which realpath)
if [[ -z $REAL_PATH ]]; then
    echo "$0: cannot find command: realpath" 1>&2
    exit 14
fi

# initialize the job directories
#
echo "$0: initialize the job directories"
mkdir -p -m 0755 "$RANGE_H_0MOD3"
mkdir -p -m 0755 "$RANGE_H_NOT0MOD3"
ls -ld "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3"
echo

# form symlinks if -b
#
if [[ -n "$BASELINE" ]]; then
    echo "$0: setup symlinks due to -b flag"
    rm -f "$SYMLINK_RANGE_H_0MOD3"
    echo ln -s "$RANGE_H_0MOD3" "$SYMLINK_RANGE_H_0MOD3"
    ln -s "$RANGE_H_0MOD3" "$SYMLINK_RANGE_H_0MOD3"
    rm -f "$SYMLINK_RANGE_H_NOT0MOD3"
    echo ln -s "$RANGE_H_NOT0MOD3" "$SYMLINK_RANGE_H_NOT0MOD3"
    ln -s "$RANGE_H_NOT0MOD3" "$SYMLINK_RANGE_H_NOT0MOD3"
    ls -l "$SYMLINK_RANGE_H_0MOD3" "$SYMLINK_RANGE_H_NOT0MOD3"
    echo
fi

# foreach directory, generate lists of h n files that are similar in length
#
echo "generaring list-h-n files in $RANGE_H_0MOD3"
"$GEN_H0MOD3_CALC" "$BASE_N" "$COUNT" | split --lines="$COUNT" --suffix-length=5 - "$RANGE_H_0MOD3/list-h-n."
find "$RANGE_H_0MOD3/" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
echo
#
echo "generaring list-h-n files in $RANGE_H_NOT0MOD3"
"$GEN_HNOT0MOD3_CALC" "$BASE_N" "$COUNT" | split --lines="$COUNT" --suffix-length=5 - "$RANGE_H_NOT0MOD3/list-h-n."
find "$RANGE_H_NOT0MOD3/" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
echo

# form slurm jobs for each directory
#
for dir in "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3"; do

    # determine full path of directory
    #
    export FULL_PATH=$("$REAL_PATH" "$dir")

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
    echo
done
