#!/bin/bash

# Copies and compresses netCDF files (mps, 8/24/17)

dir="/n/regal/jacob_lab/msulprizio/TCCON/ncdf/"

for file in $dir/*; do

    fname=${file##*/}
    echo "Copying $fname"

    nccopy -d1 $file ./$fname

done