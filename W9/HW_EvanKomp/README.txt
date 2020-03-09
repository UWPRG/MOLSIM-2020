gmxgmIn your homework, you will perform four simulations on the system I showed in class. For the purpose of practice, you will start from scratch, that is, starting from the PME.pdb file.

The order to perfrom this simualtion is:
Step 1: generate the initial configuration
	a) Convert .pdb to .gro using pdb2gmx, and, at the same time, creating a topology file called topol.top
		gmx_mpi pdb2gmx -f PME.pdb -o PME.gro -water tip3p
	b) Generate a simulation cell of a proper dimension and put the molecule PME in the center of the box. Here, my box size is 3X3X3 (nm). Your box size should be at lease twice the forcefield cutoff range.
		gmx_mpi editconf -f PME.gro -o PME_box.gro -box 3 3 3 -bt cubic -c
	c) Solvate the molecule. Fill the simulation cell with water molecule. Because you are adding waters to yout system, you need to update your topology file. Thus, you will need to include -p topol.top. Basically, everytime you modify the content in the cell, you need to update the topology file.
		gmx_mpi solvate -cp PME_box.gro -cs spc216.gro -o PME_solvate.gro -p topol.top
	
Step 2: do an energy minization to remove any atom overlapping.
	a) Grompp readable files into a binary file --> em.tpr. The .tpr file contains the information of atom coordinates, molecule topolody and how you want GROMACS to run a minimization.
		gmx_mpi grompp -f em.mdp -c PME_solvate.gro -p topol.top -o em.tpr
	b) Run the .tpr file and output data
		gmx_mpi mdrun -s em.tpr -c em.gro -e em.edr -o em.trr -g em.log

Step 3: equilibrate your system in an NPT ensemble to reach a desired temperature and pressure combination
	a) Grompp readable files into a binary file
		gmx_mpi grompp -f equil_npt.mdp -c em.gro -p topol.top -o equil_npt.tpr
	b) Run the .tpr file
		gmx_mpi mdrun -s equil_npt.tpr -c equil_npt.gro -e equil_npt.edr -o equil_npt.trr -g equil_npt.log -v >& equil_npt_log.txt

Step 4: equilibrate your system in the Nose-Hoover thermostat in preparation for collecting data in Nose-Hoover thermostat
	a) gmx_mpi grompp -f equil_nvt.mdp -c equil_npt.gro -p topol.top -o equil_nvt.tpr
	b) gmx_mpi mdrun -s equil_nvt.tpr -c equil_nvt.gro -e equil_nvt.edr -o equil_nvt.trr -g equil_nvt.log -v >& equil_nvt_log.txt

Step 5: Run the production run. Usually, this is the moment you start to collect data for your papers.
	a) gmx_mpi grompp -f prod_nvt.mdp -c equil_npt.gro -p topol.top -o prod_nvt.tpr
	b) gmx_mpi mdrun -s prod_nvt.tpr -c prod_nvt.gro -e prod_nvt.edr -o prod_nvt.trr -g prod_nvt.log -v >& prod_nvt_log.txt


You will need to do your homework on stf. Please follow the steps here:
1. log on to your stf on ikt. Go to the directory: /suppscr/stf/YOURNETID/
2. Create three directories for three simulations:
	mkdir MolSim_5_HW/Normal_run
	mkdir MolSim_5_HW/NVE_1
	mkdir MolSim_5_HW/NVE_2
3. Upload the files in the MolSim_HW5.zip to MolSim_5_HW/Normal_run
4. Request an interactive node for 12 hours 
	srun -p stf -A stf --time=12:00:00 --pty /bin/bash 
5. Load modules to run GROMACS
	module load icc_15.0.3-impi_5.0.3 
	source /suppscr/sw/contrib/gromacs-5.1.3-with-icc_15.0.3-impi_5.0.3/installation_impi/bin/GMXRC 
6. Execute command lines in Step 1-6.
	*** when executing gmx_mpi dmrun, add mpirun -np 8 at the beginning of the line. This will run your system in 8 sub-domain in parallel. For example:
		mpirun -np 8 gmx_mpi mdrun -s equil_npt.tpr -c equil_npt.gro -e equil_npt.edr -o equil_npt.trr -g equil_npt.log -v >& equil_npt_log.txt
7. Analyze your result in all three runs using the following command.
	gmx_mpi energy –f XXXX.edr –o thermo_XXXX.xvg
  Choose the number for the quantity you'd like to analyze and hit 0 and enter. 
8. Visualize using gnuplot
	gnuplot
	gnuplot > p ‘thermo_XXXX.xvg' u 1:2 w l 
9. Visualize your trajectory using vmd
	vmd XXXX.gro XXXX.trr
   In the vmd terminal, type 
	vmd > pbc box
   to visualize the box.


Your homework:
1. Carefully read the mdp file to understand the constrcution of doing a MD simulation
2. Run the files provided and plot pressure vs timestep and temperature vs timestep in npt, nvt equilibration and nvt production stage.
3. Starting from the same PME.pdb file, do energy minization and run a npt equilibration at 298 K and 1 bar. Then run the system in an NVE ensemble for 0.5 ns and observe how temperature changes with time.
4. Starting from the same PME.pdb file, after you do energy minimization, do 2 NVE simulations, with and without giving an initial velocity at 298 K. Plot temperature vs. time and discuss the result you observe.


The homework is due Thursday 2/13/2020, but if people have trouble with simulations or plotting, I'm happy to extend the due date to Tuesday 2/18/2020. 
If you have any questions, you can find me in Benson B17!
