#!/bin/bash

## Give the Job a descriptive name
#PBS -N make

## Output and error files
#PBS -o make.out
#PBS -e make.err

## How many machines should we get? 
#PBS -l nodes=1:ppn=1

##How long should the job run for?
#PBS -l walltime=00:01:00

## Start 
## Run make in the src folder (modify properly)

module load openmpi/1.8.3
cd /home/parallel/parlab12/MPI/mpi
make
