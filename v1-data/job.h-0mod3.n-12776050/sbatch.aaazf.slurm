#!/bin/bash
#
# sbatch.aaazf.slurm - generate a jacboi +-0 string for from file list-h-n.aaazf
#
# SLURM submission parameters
#
#SBATCH --job-name=h-0mod3.n-12776050	# name of this job
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-08:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaazf		# stdout
#SBATCH --error=stderr.aaazf		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/job.h-0mod3.n-12776050"
/usr/bin/time -o "time.aaazf" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaazf" 256
