#!/bin/bash
#
# sbatch.aaadj.slurm - generate a jacboi +-0 string for from file list-h-n.aaadj
#
# SLURM submission parameters
#
#SBATCH --job-name=h-not0mod3.n-6286862	# name of this job
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-08:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaadj		# stdout
#SBATCH --error=stderr.aaadj		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/baseline/job.h-not0mod3.n-6286862"
/usr/bin/time -o "time.aaadj" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaadj" 256
