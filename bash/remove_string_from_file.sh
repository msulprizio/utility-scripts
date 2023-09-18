#!/bin/bash

# This script takes a given string out of a filename

# Specify start and end years
START=1751
END=1799

DIR="/n/holylfs/EXTERNAL_REPOS/GEOS-CHEM/gcgrid/gcdata/ExtData/HEMCO/CEDS/v2018-08/"

for (( YEAR=$START; YEAR<=$END; YEAR++ )); do

    cd $DIR/$YEAR
    pwd

    for filename in *.nc; do

	# Remove extra .nc at end of filename
	newfile=${filename%.nc}
	mv -v $filename $newfile
	
    done
    
done

exit 0
