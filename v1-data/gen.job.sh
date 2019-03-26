#!/bin/bash
#
# gen.job.sh - generate SLURM job directories and input data files

# setup
#
export START_N="4331116"
export COUNT="1000"
export RANGE_H_0MOD3="job.range-h-0mod3"
export RANGE_H_NOT0MOD3="job.range-h-not0mod3"
export PRIME_H_0MOD3="job.prime-h-0mod3"
export PRIME_H_NOT0MOD3="job.prime-h-not0mod3"
export GEN_H0MOD3_CALC="./h0mod3-n.calc"
export GEN_HNOT0MOD3_CALC="./hnot0mod3-n.calc"
export VERIFIED_PRIME_H_0MOD3="../h-0mod3-n.verified-prime.txt"
export VERIFIED_PRIME_H_NOT0MOD3="../h-not0mod3-n.verified-prime.txt"
export FORM_SLURM="form.slurm.sh"

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
for dir in "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3" "$PRIME_H_0MOD3" "$PRIME_H_NOT0MOD3"; do

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
echo "generaring list-h-n files in $RANGE_H_0MOD3"
"$GEN_H0MOD3_CALC" "$START_N" "$COUNT" | split --lines="$COUNT" --suffix-length=5 - "$RANGE_H_0MOD3/list-h-n."
find "$RANGE_H_0MOD3" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
echo "generaring list-h-n files in $RANGE_H_NOT0MOD3"
"$GEN_HNOT0MOD3_CALC" "$START_N" "$COUNT" | split --lines="$COUNT" --suffix-length=5 - "$RANGE_H_NOT0MOD3/list-h-n."
find "$RANGE_H_NOT0MOD3" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
echo "generaring list-h-n files in $PRIME_H_0MOD3"
split --lines="$COUNT" --suffix-length=5 "$VERIFIED_PRIME_H_0MOD3" "$PRIME_H_0MOD3/list-h-n."
find "$PRIME_H_0MOD3" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444
echo "generaring list-h-n files in $PRIME_H_NOT0MOD3"
split --lines="$COUNT" --suffix-length=5 "$VERIFIED_PRIME_H_NOT0MOD3" "$PRIME_H_NOT0MOD3/list-h-n."
find "$PRIME_H_NOT0MOD3" -mindepth 1 -maxdepth 1 -name 'list-h-n.*' -print0 | xargs -0 chmod 0444

# form slurm jobs for each directory
#
for dir in "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3" "$PRIME_H_0MOD3" "$PRIME_H_NOT0MOD3"; do

    # determine the type
    #
    TYPE=$(basename "$dir" | sed -e 's/job.//')

    # start the run.all.sh file
    #
    echo "#!/bin/bash" > "$dir/run.all.sh"
    echo "#" >> "$dir/run.all.sh"
    echo "# run.all.sh - run all slurm jobs for $TYPE" >> "$dir/run.all.sh"
    echo "#" >> "$dir/run.all.sh"
    echo "cd $PWD/$dir" >> "$dir/run.all.sh"
    chmod 0755 "$dir/run.all.sh"

    # process this directory
    #
    echo "generaring sbatch slurm jobs for $dir"
    find "$dir" -mindepth 1 -maxdepth 1 -type f -name 'list-h-n.*' | while read file; do

	# determine the job ID
	#
	ID=$(basename "$file" | sed -e 's/list-h-n.//')

	# generate the slrum file
	#
	/bin/bash "$FORM_SLURM" "$PWD" "$TYPE" "$ID" > "$dir/sbatch.$ID.slurm"
	chmod 0444 "$dir/sbatch.$ID.slurm"

	# add to the run.all.sh file
	#
	echo "sbatch sbatch.$ID.slurm" >> "$dir/run.all.sh"
    done
    chmod 0555 "$dir/run.all.sh"
done
