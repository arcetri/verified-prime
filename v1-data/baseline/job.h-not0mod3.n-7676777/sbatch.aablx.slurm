#!/bin/bash
#
# sbatch.aablx.slurm - generate a jacboi +-0 string for from file list-h-n.aablx
#
# SLURM submission parameters
#
#SBATCH --job-name=h-not0mod3.n-7676777	# name of this job
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-08:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aablx		# stdout
#SBATCH --error=stderr.aablx		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/baseline/job.h-not0mod3.n-7676777"
/usr/bin/time -o "time.aablx" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aablx" 256
