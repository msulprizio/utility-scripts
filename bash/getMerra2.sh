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

DATADIR="/n/holyscratch01/external_repos/GEOS-CHEM/gcgrid/gcdata/ExtData/"

# Year(s) of met data to download
for YEAR in "2017"; do

# Loop over months
for MONTH in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12"; do

 #--------------------------------------------------------------------
 # 0.5 x 0.625 global
 #--------------------------------------------------------------------

 # Change directory
 cd $DATADIR/GEOS_0.5x0.625/MERRA2/
 pwd

 # Get files
 wget -r -np -nH --cut-dirs=3 -A "*.nc4" -e robots=off "http://geoschemdata.wustl.edu/ExtData/GEOS_0.5x0.625/MERRA2/$YEAR/$MONTH/"

 # Change permissions
 chmod 775 $YEAR/
 chmod 775 $YEAR/$MONTH
 chmod 664 $YEAR/$MONTH/*

 # Change group to "jacob_gcst"
 chgrp jacob_gcst $YEAR
 chgrp jacob_gcst $YEAR/*
 chgrp jacob_gcst $YEAR/*/*
    
 #--------------------------------------------------------------------
 # 0.5 x 0.625 AS
 #--------------------------------------------------------------------

 # Change directory
 cd $DATADIR/GEOS_0.5x0.625_AS/MERRA2/
 pwd

 # Get files
 wget -r -np -nH --cut-dirs=3 -A "*.nc4" -e robots=off "http://geoschemdata.wustl.edu/ExtData/GEOS_0.5x0.625_AS/MERRA2/$YEAR/$MONTH/"

 # Change permissions
 chmod 775 $YEAR/
 chmod 775 $YEAR/$MONTH
 chmod 664 $YEAR/$MONTH/*

 # Change group to "jacob_gcst"
 chgrp jacob_gcst $YEAR
 chgrp jacob_gcst $YEAR/*
 chgrp jacob_gcst $YEAR/*/*
    
 #--------------------------------------------------------------------
 # 0.5 x 0.625 NA
 #--------------------------------------------------------------------
 
 # Change directory
 cd $DATADIR/GEOS_0.5x0.625_NA/MERRA2/
 pwd
 
 # Get files
 wget -r -np -nH --cut-dirs=3 -A "*.nc4" -e robots=off "http://geoschemdata.wustl.edu/ExtData/GEOS_0.5x0.625_NA/MERRA2/$YEAR/$MONTH/"
 
 # Change permissions
 chmod 775 $YEAR/
 chmod 775 $YEAR/$MONTH
 chmod 664 $YEAR/$MONTH/*

 # Change group to "jacob_gcst"
 chgrp jacob_gcst $YEAR
 chgrp jacob_gcst $YEAR/*
 chgrp jacob_gcst $YEAR/*/*

 #--------------------------------------------------------------------
 # 2 x 2.5
 #--------------------------------------------------------------------

 # Change directory
 cd $DATADIR/GEOS_2x2.5/MERRA2/
 pwd

 # Get files
 wget -r -np -nH --cut-dirs=3 -A "*.nc4" -e robots=off "http://geoschemdata.wustl.edu/ExtData/GEOS_2x2.5/MERRA2/$YEAR/$MONTH/"

 # Change permissions
 chmod 775 $YEAR/
 chmod 775 $YEAR/$MONTH
 chmod 664 $YEAR/$MONTH/*

 # Change group to "jacob_gcst"
 chgrp jacob_gcst $YEAR
 chgrp jacob_gcst $YEAR/*
 chgrp jacob_gcst $YEAR/*/*
 
#--------------------------------------------------------------------
# 4 x 5
#--------------------------------------------------------------------

 # Change directory
 cd $DATADIR/GEOS_4x5/MERRA2/
 pwd

 # Get files
 wget -r -np -nH --cut-dirs=3 -A "*.nc4" -e robots=off "http://geoschemdata.wustl.edu/ExtData/GEOS_4x5/MERRA2/$YEAR/$MONTH/"

 # Change permissions
 chmod 775 $YEAR/
 chmod 775 $YEAR/$MONTH
 chmod 664 $YEAR/$MONTH/*

 # Change group to "jacob_gcst"
 chgrp jacob_gcst $YEAR
 chgrp jacob_gcst $YEAR/*
 chgrp jacob_gcst $YEAR/*/*

done
done

exit 0
