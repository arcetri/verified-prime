#!/bin/bash
#
# sbatch.aaayx.slurm - generate a jacboi +-0 string for from file list-h-n.aaayx
#
# SLURM submission parameters
#
#SBATCH --job-name=h-0mod3.n-4194304	# name of this job
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-08:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaayx		# stdout
#SBATCH --error=stderr.aaayx		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/baseline/job.h-0mod3.n-4194304"
/usr/bin/time -o "time.aaayx" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaayx" 256
