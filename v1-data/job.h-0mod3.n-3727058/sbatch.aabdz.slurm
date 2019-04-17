#!/bin/bash
#
# sbatch.aabdz.slurm - generate a jacboi +-0 string for from file list-h-n.aabdz
#
# SLURM submission parameters
#
#SBATCH --job-name=h-0mod3.n-3727058	# name of this job
#SBATCH --partition=arcetri_comp	# cluster partition to use
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-01:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aabdz		# stdout
#SBATCH --error=stderr.aabdz		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/job.h-0mod3.n-3727058"
/usr/bin/time -o "time.aabdz" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aabdz" 167
