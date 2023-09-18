#!/bin/bash
#
# Script for downloading latest GFAS data from the University of York
# Melissa Sulprizio (11/7/18)
#
if [[ $# == 2 ]] ; then
    year=$1
    month=$2
else
   echo "Usage: getGFAS.sh YYYY MM"
   exit 1
fi
    
# Download latest files from York
wget -r -nH --cut-dirs=3 "https://webfiles.york.ac.uk/WACL/GFAS/INCOMING/GFAS_$year$month.nc"

# Create year directory if it doesn't exist
if [[ ! -d $year ]] ; then
    mkdir $year
    chmod 775 $year
    chgrp jacob_gcst $year
fi

# Change permissions and move file into appropriate year directory
chmod 664 GFAS_$year$month.nc
chgrp jacob_gcst GFAS_$year$month.nc
mv GFAS_$year$month.nc $year

exit 0
