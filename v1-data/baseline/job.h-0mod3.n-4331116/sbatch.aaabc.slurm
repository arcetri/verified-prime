#!/bin/bash
#
# sbatch.aaabc.slurm - generate a jacboi +-0 string for from file list-h-n.aaabc
#
# SLURM submission parameters
#
#SBATCH --job-name=h-0mod3.n-4331116	# name of this job
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-08:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaabc		# stdout
#SBATCH --error=stderr.aaabc		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/baseline/job.h-0mod3.n-4331116"
/usr/bin/time -o "time.aaabc" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaabc" 256
