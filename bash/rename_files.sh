#!/bin/bash

# Renames all file in a directory
START=1980
END=2018

# Loop over years 
for (( YYYY=$START; YYYY<=$END; YYYY++ )); do

    # Loop over months
    for month in {1..12}; do

        # Month string
        MM=`printf "%02d\n" $month`

	# Data directory
	dir="/n/holylfs/EXTERNAL_REPOS/GEOS-CHEM/gcgrid/data/ExtData/HEMCO/OFFLINE_DUST/v2019-01/0.5x0.625/${YYYY}/${MM}/"

	# Old string and new string
	old="0625"
	new="05"

	# Loop over files
	for file in ${dir}*${old}*; do

	    # Replace old string with new string
	    mv -v "${file}" "${file/$old/$new}"

	    # Or just remove old string
	    #mv -v "${file}" "${file/$old}"

	done
    done
done

# All done
exit 0
