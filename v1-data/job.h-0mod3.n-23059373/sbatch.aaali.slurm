#!/bin/bash
#
# sbatch.aaali.slurm - generate a jacboi +-0 string for from file list-h-n.aaali
#
# SLURM submission parameters
#
#SBATCH --job-name=h-0mod3.n-23059373	# name of this job
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-08:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaali		# stdout
#SBATCH --error=stderr.aaali		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/job.h-0mod3.n-23059373"
/usr/bin/time -o "time.aaali" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaali" 256
