#!/bin/bash
#
# gen.prime-all.sh - generate SLURM job input data for verified primes
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
export RANGE_H_0MOD3="job.h-0mod3.prime-all"
export RANGE_H_NOT0MOD3="job.h-not0mod3.prime-all"
export GEN_H0MOD3_CALC="./h0mod3-n.calc"
export GEN_HNOT0MOD3_CALC="./hnot0mod3-n.calc"
export VERIFIED_RANGE_H_0MOD3="../h-0mod3-n.verified-prime.txt"
export VERIFIED_RANGE_H_NOT0MOD3="../h-not0mod3-n.verified-prime.txt"
export FORM_SLURM="form.slurm.sh"
export COUNT=1000
export MAX=256		# maximum v(1) value we track
export DEF_MAX_V1=999	# must be same as DEF_MAX_V1 in jacobi-stat.h
if [[ $MAX -gt $DEF_MAX_V1 ]]; then
    echo "$0: FATAL: Internal error: MAX: $MAX > DEF_MAX_V1: $DEF_MAX_V1" 1>&2
    echo "$0: FATAL: Internal error: DEF_MAX_V1 must match DEF_MAX_V1 in jacobi-stat.h" 1>&2
    echo "$0: FATAL: Internal error: MAX must not exceed $DEF_MAX_V1" 1>&2
    exit 1
fi

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
echo "$0: checking setup"
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
fi
if [[ -z "$RANGE_H_NOT0MOD3" ]]; then
    echo "$0: FATAL: Internal error: "'$'"RANGE_H_NOT0MOD3 is empty" 1>&2
    exit 7
fi
if [[ -z $FORCE ]]; then
    if [[ -e $RANGE_H_0MOD3 ]]; then
	echo "$0: FATAL: already exists: $RANGE_H_0MOD3" 1>&2
	exit 10
    fi
    if [[ -e $RANGE_H_NOT0MOD3 ]]; then
	echo "$0: FATAL: already exists: $RANGE_H_NOT0MOD3" 1>&2
	exit 11
    fi
else
    if [[ -d "$RANGE_H_0MOD3" ]]; then
	chmod 0755 "$RANGE_H_0MOD3"
    elif [[ -e "$RANGE_H_0MOD3" ]]; then
	echo "$0: FATAL: already exists and is not a directory: $RANGE_H_0MOD3" 1>&2
	exit 14
    fi
    if [[ -d "$RANGE_H_NOT0MOD3" ]]; then
	chmod 0755 "$RANGE_H_NOT0MOD3"
    elif [[ -e "$RANGE_H_NOT0MOD3" ]]; then
	echo "$0: FATAL: already exists and is not a directory: $RANGE_H_NOT0MOD3" 1>&2
	exit 15
    fi
fi
export REAL_PATH=$(which realpath)
if [[ -z $REAL_PATH ]]; then
    echo "$0: cannot find command: realpath" 1>&2
    exit 18
fi
echo

# initialize the job directories
#
echo "$0: initialize the job directories"
mkdir -p -m 0755 "$RANGE_H_0MOD3"
mkdir -p -m 0755 "$RANGE_H_NOT0MOD3"
ls -ld "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3"
echo

# foreach directory, generate lists of h n files that are similar in length
#
if [[ -n $FORCE ]]; then
    echo "$0: removing list-h-n files in $RANGE_H_0MOD3"
    find "$RANGE_H_0MOD3/" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -delete
fi
echo "$0: generaring list-h-n files in $RANGE_H_0MOD3"
split -l "$COUNT" -a 5 "$VERIFIED_RANGE_H_0MOD3" "$RANGE_H_0MOD3/list-h-n."
find "$RANGE_H_0MOD3/" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
echo
#
if [[ -n $FORCE ]]; then
    echo "$0: removing list-h-n files in $RANGE_H_NOT0MOD3"
    find "$RANGE_H_NOT0MOD3/" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -delete
fi
echo "$0: generaring list-h-n files in $RANGE_H_NOT0MOD3"
split -l "$COUNT" -a 5 "$VERIFIED_RANGE_H_NOT0MOD3" "$RANGE_H_NOT0MOD3/list-h-n."
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
    if [[ -n $FORCE && -e "$dir/run.all.sh" ]]; then
	rm -f "$dir/run.all.sh"
	if [[ -e "$dir/run.all.sh" ]]; then
	    echo "$0: FATAL: cannot pre-remove $dir/run.all.sh" 1>&2
	    exit 19
	fi
    fi
    cat <<EOF > "$dir/run.all.sh"
#!/bin/bash
#
# run.all.sh - run all slurm jobs for $TYPE

# launch jobs from within the job directory
#
cd $FULL_PATH

# use sbatch of we have SLURM, else use the shell
#
export SBATCH=\$(which sbatch)
if [[ -n \$SBATCH ]]; then
    echo "\$0: using sbatch to launch jobs: \$SBATCH"
else
    echo "\$0: using shell to launch jobs"
fi

EOF

    # process this directory
    #
    echo "$0: generaring sbatch slurm jobs for $dir"
    if [[ -n $FORCE ]]; then
	find "$dir/" -mindepth 1 -maxdepth 1 -name 'sbatch.*' -delete
	find "$dir/" -mindepth 1 -maxdepth 1 -name 'stderr.*' -delete
	find "$dir/" -mindepth 1 -maxdepth 1 -name 'time.*' -delete
	find "$dir/" -mindepth 1 -maxdepth 1 -name 'tally.*' -delete
	find "$dir/" -mindepth 1 -maxdepth 1 -name 'jacobi.*' -delete
	find "$dir/" -mindepth 1 -maxdepth 1 -name 'global.stats' -delete
    fi
    find "$dir/" -mindepth 1 -maxdepth 1 -type f -name 'list-h-n.*' -print | while read file; do

	# determine the job ID
	#
	ID=$(basename "$file" | sed -e 's/list-h-n.//')

	# generate the slrum file
	#
	/bin/bash "$FORM_SLURM" "$dir" "$ID" "$MAX" > "$dir/sbatch.$ID.slurm"
	chmod 0444 "$dir/sbatch.$ID.slurm"

	# add to the run.all.sh file
	#
cat <<EOF2 >> "$dir/run.all.sh"
# launch job for $ID
#
if [[ -n \$SBATCH ]]; then
    "\$SBATCH" "sbatch.$ID.slurm"
else
    sh "./sbatch.$ID.slurm" > "jacobi.$ID" 2> "stderr.$ID"
fi

EOF2
    done
    cat <<EOF3 >> "$dir/run.all.sh"
# All Done!!! -- Jessica Noll, Age 2
#
exit 0
EOF3
    chmod 0555 "$dir/run.all.sh"
    echo
done

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
