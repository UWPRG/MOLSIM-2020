for walk in 2 4 8; do
    omp=1
    mpi=16
    mkdir walk${walk}mpi${mpi}omp${omp}
    cd walk${walk}mpi${mpi}omp${omp}
    cp /gscratch/davinci/usr/nidajanu/Molsim/HW_7/npt.tpr .
    cp /gscratch/davinci/usr/nidajanu/Molsim/HW_7/cl_job.sh .
    echo "mpiexec.hydra -n" $mpi "gmx_mpi mdrun -deffnm npt -ntomp" $omp "-multi" $walk  "&> log.txt" >> cl_job.sh   # This is the line that should be changed
    sbatch cl_job.sh
    cd ..
done
