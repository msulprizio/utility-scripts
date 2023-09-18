#!/bin/bash

# This script will compress and chunk nested met fields
#
# Reminder: Only compress one directory at a time to avoid overwriting tmp.nc
#

#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 0-30:00
#SBATCH -p huce_intel,seas_compute,shared
#SBATCH --mem=2000
#SBATCH --mail-type=END

# 2-letter region ID
NestedRegion="SA"
Year=2018

NestedDir="GEOS_0.25x0.3125_${NestedRegion}/GEOS_FP"

# Loop over months
for (( Month=1; Month<=12; Month++)); do

    # Set mm string
    if (( $Month < 10 )); then
        mm="0${Month}"
    else
        mm="${Month}"
    fi
    
    printf "Processing month $mm\n"

    # Path to  files
    InPath="${NestedDir}/${Year}/${mm}"

    for file in $InPath/*.nc*; do

	# Compress and chunk using deflate level=5
	nc_chunk.pl $file 5

    done
    
done
