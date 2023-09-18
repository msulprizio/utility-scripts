#!/bin/bash

# Fixes timestamps for monthly emission files (mps, 6/19/17)

#module load nco

# Loop over files
#for file in *.nc; do

file="Soil_Absorption_4x5_2012.nc"

    echo $file

    # Non-leap year
#    ncap2 -O -h -s 'time[time]={0.0,744.0,1416.0,2160.0,2880.0,3624.0, 4344.0,5088.0,5832.0,6552.0,7296.0,8016.0};time@long_name="Time";time@calendar="standard";time@units="hours since 2015-01-01 00:00:00"' $file tmp.nc

    # Leap year
    ncap2 -O -h -s 'time[time]={0.0,744.0,1440.0,2184.0,2904.0,3648.0, 4368.0,5112.0,5856.0,6576.0,7320.0,8040.0};time@long_name="Time";time@calendar="standard";time@units="hours since 2012-01-01 00:00:00"' $file tmp.nc

    # Make time dimension unlimited 
    ncks -a -h -O --mk_rec time tmp.nc $file
    rm tmp.nc

#done

# All done
exit 0
