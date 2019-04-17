#!/bin/bash
#
# sbatch.aaaql.slurm - generate a jacboi +-0 string for from file list-h-n.aaaql
#
# SLURM submission parameters
#
#SBATCH --job-name=h-0mod3.n-7676777	# name of this job
#SBATCH --partition=arcetri_comp	# cluster partition to use
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-00:20:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaaql		# stdout
#SBATCH --error=stderr.aaaql		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/job.h-0mod3.n-7676777"
/usr/bin/time -o "time.aaaql" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaaql" 167
