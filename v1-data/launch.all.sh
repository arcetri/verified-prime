#!/bin/bash
#
# launch.all - launch all slurm jobs from all directories

# setup
#
export RANGE_H_0MOD3="job.range-h-0mod3"
export RANGE_H_NOT0MOD3="job.range-h-not0mod3"
export PRIME_H_0MOD3="job.prime-h-0mod3"
export PRIME_H_NOT0MOD3="job.prime-h-not0mod3"

# firewall
#
for dir in "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3" "$PRIME_H_0MOD3" "$PRIME_H_NOT0MOD3"; do
    if [[ ! -d "$dir" ]]; then
	echo "$0: FATAL: missing directory: $dir" 1>&2
	exit 1
    fi
    if [[ ! -x "$dir/run.all.sh" ]]; then
	echo "$0: FATAL: missing executable: $dir/run.all.sh" 1>&2
	exit 1
    fi
done

# launch
#
for dir in "$RANGE_H_0MOD3" "$RANGE_H_NOT0MOD3" "$PRIME_H_0MOD3" "$PRIME_H_NOT0MOD3"; do
    echo "launching jobs for $dir"
    /bin/bash "$dir/run.all.sh"
done
