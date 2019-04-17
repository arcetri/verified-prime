#!/bin/bash
#
# sbatch.aaayr.slurm - generate a jacboi +-0 string for from file list-h-n.aaayr
#
# SLURM submission parameters
#
#SBATCH --job-name=h-not0mod3.n-132174368	# name of this job
#SBATCH --partition=arcetri_comp	# cluster partition to use
#SBATCH --qos=normal			# normal priority job queue
#SBATCH --ntasks=1			# number of tasks to run
#SBATCH --mem-per-cpu=1G		# virtual memory per process
#SBATCH --time=0-10:00:00		# total time limit (D-HH:MM:SS)
#SBATCH --output=jacobi.aaayr		# stdout
#SBATCH --error=stderr.aaayr		# stderr
#SBATCH --requeue			# job will be requeued after a node failure

cd "/usr/global/src/cisco/verified-prime/v1-data/job.h-not0mod3.n-132174368"
/usr/bin/time -o "time.aaayr" "/usr/global/src/cisco/verified-prime/v1-data/jacobi-h-n.calc" "list-h-n.aaayr" 167
