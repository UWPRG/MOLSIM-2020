for mpi in 1 2 4 8 16; do
    omp=$((16 / mpi))
    mkdir mpi${mpi}omp${omp}
    cd mpi${mpi}omp${omp}
    cp /gscratch/davinci/usr/nidajanu/Molsim/HW_7/npt.tpr .
    cp /gscratch/davinci/usr/nidajanu/Molsim/HW_7/cl_job.sh .
    echo "mpiexec.hydra -n" $mpi "gmx_mpi mdrun -deffnm npt -ntomp" $omp "&> log.txt" >> cl_job.sh   # This is the line that should be changed
    sbatch cl_job.sh
    cd ..
done
