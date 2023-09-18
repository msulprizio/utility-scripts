#!/bin/bash

#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 3-00:00
#SBATCH -p huce_intel
#SBATCH --mem=2000
#SBATCH --mail-type=END

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# This scrips gets MERRA-2 data from Dalhousie and puts it in the appropriate
# directory in /n/holylfs/EXTERNAL_REPOS/GEOS-CHEM/gcgrid/
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

export OMP_NUM_THREADS=$SLURM_NTASKS

DATADIR="/n/holyscratch01/external_repos/GEOS-CHEM/gcgrid/gcdata/ExtData/HEMCO/OFFLINE_LIGHTNING/v2020-03/"

# Year(s) of met data to download
for YEAR in "2014" "2015" "2016" "2017" "2018" "2019"; do

# Loop over months
#for MONTH in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12"; do

 #--------------------------------------------------------------------
 # 0.5 x 0.625 global
 #--------------------------------------------------------------------

 # Change directory
 cd $DATADIR/GEOSFP
 pwd

 # Get files
 wget -r -np -nH --cut-dirs=5 -A "*.nc4" "http://geoschemdata.computecanada.ca/ExtData/HEMCO/OFFLINE_LIGHTNING/v2020-03/GEOSFP/$YEAR/"

 # Change permissions
 chmod 775 $YEAR/
 chmod 775 $YEAR
 chmod 664 $YEAR/*

 # Change group to "jacob_gcst"
 chgrp jacob_gcst $YEAR
 chgrp jacob_gcst $YEAR/*
    

#done
done

exit 0
