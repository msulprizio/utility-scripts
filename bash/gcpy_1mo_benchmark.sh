#!/bin/bash

#SBATCH -c 8
#SBATCH -N 1
#SBATCH -t 0-12:00
#SBATCH -p huce_intel,seas_compute,shared
#SBATCH --mem=48000
#SBATCH --mail-type=END

# Set the proper # of threads for OpenMP
# SLURM_CPUS_PER_TASK ensures this matches the number you set with -c above
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

#source activate gcpy_env

srun -c $OMP_NUM_THREADS time -p ~/gcpy/benchmark/run_benchmark.py 1mo_benchmark.yml

#conda deactivate

exit 0
#EOC 
