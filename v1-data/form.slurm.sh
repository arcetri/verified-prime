#!/bin/bash
#
# form.slurm.sh - form a slurm job for generating jacboi +-0 strings
#
# usage:
#
#	form.slurm.sh topdir type id > file.slurm
#
#	topdir		top level directory
#	type		job name and type
#
#	    	type examples:
#
#		    prime-h-0mod3
#		    prime-h-not0mod3
#		    range-h-0mod3
#		    range-h-not0mod3
#
#	id		list-h-n ID
#
#		type example:
#
#		    aabml

# parse args
#
if [[ $# -ne 3 ]]; then
    echo "$0: FATAL: requires 3 args" 1>&2
    echo "usage: $0 topdir type id" 1>&2
    exit 1
fi
export TOPDIR="$1"
export TYPE="$2"
export ID="$3"

cat << EOF
#!/bin/bash
#
# sbatch.$ID.slurm - generate a jacboi +-0 string for from file list-h-n.$ID
#
# SLURM submission parameters
#
#SBATCH --job-name=$TYPE	# name of this job
#SBATCH --partition=arcetri_comp	# cluster partition to use
#SBATCH --qos=urgent			# normal priority job queue
#SBATCH --nodes=1			# number of nodes to use
#SBATCH --ntasks-per-node=1		# number of tasks per node
#SBATCH --cpus-per-task=1		# number of cores per task
#SBATCH --time=0-00:10:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.$ID		# stdout
#SBATCH --error=stderr.$ID		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

export TOPDIR="$TOPDIR"
export TYPE="$TYPE"
export ID="$ID"

/usr/bin/time -o "\$TOPDIR/job.$TYPE/time.\$ID" "\$TOPDIR/jacobi-h-n.calc" "\$TOPDIR/job.\$TYPE/list-h-n.\$ID" 1 167
EOF
