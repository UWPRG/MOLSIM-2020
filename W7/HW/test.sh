#!/bin/bash

for mpi in 1 2 4 8 16; do
    omp=$((16 / mpi))
    mkdir mpi${mpi}omp${omp}
    cd mpi${mpi}omp${omp}
    echo "MPI ranks: " $mpi " OpenMP threads: " $omp  # This is the line that should be changed
    cd ..
done
