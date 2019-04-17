#!/bin/bash
#
# sbatch.aaavv.slurm - generate a jacboi +-0 string for from file list-h-n.aaavv
#
# SLURM submission parameters
#
#SBATCH --job-name=h-0mod3.n-1391827	# name of this job
#SBATCH --partition=arcetri_comp	# cluster partition to use
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-04:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaavv		# stdout
#SBATCH --error=stderr.aaavv		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/job.h-0mod3.n-1391827"
/usr/bin/time -o "time.aaavv" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaavv" 167
