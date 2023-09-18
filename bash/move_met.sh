#!/bin/bash

METDIR="/n/holylfs/EXTERNAL_REPOS/GEOS-CHEM/gcgrid/data/GEOS_0.25x0.3125_NA/GEOS_FP"

#for YEAR in "2012" "2013" "2014" "2015" "2016" "2017"; do
for YEAR in "2013"; do

  for MONTH in "01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12"; do

    mv -v $YEAR/$MONTH/* $METDIR/$YEAR/$MONTH/

  done

done

exit 0