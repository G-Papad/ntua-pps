#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_thermal

## Output and error files
#PBS -o test.out
#PBS -e test.err

## How many machines should we get? 
#PBS -l nodes=8:ppn=8

##How long should the job run for?
#PBS -l walltime=00:30:00

## Start 
## Run make in the src folder (modify properly)
module load openmpi/1.8.3
cd /home/parallel/parlab12/MPI/mpi

rm jacobi2_1.txt
rm seidelsor_1.txt

for i in 2048 4096 6144
do
	for j in jacobi2 seidelsor
	do
		declare -i count=0
		declare -i a=1
		declare -i b=1
		for t in 1 2 4 8 16 32 64
		do	
			mpirun -np $t --map-by node --mca btl self,tcp $j $i $i $a $b >> ${j}_1.txt 
			if (($count%2==0))
			then 
				((a=a*2))
			else	
				((b=b*2))
			fi
			((count=count+1))
		done
	done
done
