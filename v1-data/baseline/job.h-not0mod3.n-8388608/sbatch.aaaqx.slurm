#!/bin/bash
#
# sbatch.aaaqx.slurm - generate a jacboi +-0 string for from file list-h-n.aaaqx
#
# SLURM submission parameters
#
#SBATCH --job-name=h-not0mod3.n-8388608	# name of this job
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-08:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaaqx		# stdout
#SBATCH --error=stderr.aaaqx		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/baseline/job.h-not0mod3.n-8388608"
/usr/bin/time -o "time.aaaqx" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaaqx" 256
