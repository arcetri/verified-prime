#!/bin/bash
#
# sbatch.aaafl.slurm - generate a jacboi +-0 string for from file list-h-n.aaafl
#
# SLURM submission parameters
#
#SBATCH --job-name=h-not0mod3.n-4194304	# name of this job
#SBATCH --partition=arcetri_comp	# cluster partition to use
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-00:20:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaafl		# stdout
#SBATCH --error=stderr.aaafl		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/job.h-not0mod3.n-4194304"
/usr/bin/time -o "time.aaafl" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaafl" 167
