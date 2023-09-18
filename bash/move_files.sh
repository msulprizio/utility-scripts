#!/bin/bash

#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 1-00:00
#SBATCH -p huce_intel
#SBATCH --mem=2000
#SBATCH --mail-type=END

# This script takes hourly emission files and merges them into daily files.
# The daily files are then chunked and compressed to save space.
#
# Melissa Sulprizio
# 29 March 2019

#------------------------------------
# User-defined variables
#------------------------------------

# Input data directory
INDIR="/n/home03/cakelle2/tmp/volcanic_CARN_1978-2015_v20180523"

# Output data directory
OUTDIR="/n/scratchlfs/jacob_lab/msulprizio/GC/data/VOLCANO/v2019-08"

# File prefix
PREF="so2_volcanic_emissions_Carns."

START=1978
END=2020

# Loop over years 
for (( YYYY=$START; YYYY<=$END; YYYY++ )); do

    # Number of days per month
    if [ $((YYYY % 4)) != 0 ]; then
	DAYSINMONTH=(31 28 31 30 31 30 31 31 30 31 30 31)
    else
	DAYSINMONTH=(31 29 31 30 31 30 31 31 30 31 30 31)
    fi    

    # Create output directory if needed
    if [[ ! -d ${OUTDIR}/${YYYY} ]]; then
	mkdir ${OUTDIR}/${YYYY}
    fi

    #------------------------------------
    # Process data
    #------------------------------------

    # Loop over months
    for month in {1..12}; do

	# Month string
	MM=`printf "%02d\n" $month`

	# Create output directory if needed
	if [[ ! -d ${OUTDIR}/${YYYY}/${MM} ]]; then
	    mkdir ${OUTDIR}/${YYYY}/${MM}
	fi
    
	cp -av ${INDIR}/${PREF}${YYYY}${MM}*.rc ${OUTDIR}/${YYYY}/${MM}
    done

done
    
exit 0
