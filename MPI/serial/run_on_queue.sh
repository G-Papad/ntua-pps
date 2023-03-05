#!/bin/bash

## Give the Job a descriptive name
#PBS -N runjob

## Output and error files
#PBS -o outrunjob
#PBS -e errorrunjob

## How many machines should we get?
#PBS -l nodes=1:ppn=1

#PBS -l walltime=00:30:00

## Start 
## Run make in the src folder (modify properly)
cd /home/parallel/parlab12/MPI/serial
for i in 2048 4096 6144
do
	./jacobi ${i}
	./seidelsor ${i}  
	./redblacksor ${i}
done
