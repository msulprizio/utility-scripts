#!/bin/bash

#module load nco

IFILE="Clusters_45_July.nc"
OFILE="Clusters_45_July.new.nc"

#-------------------------------------------
# Add time dimension
#-------------------------------------------
# The original data does not have a time dimension/variable,
# so create both from scratch.

TAU=0.0  # 2009-01-01

ncap2 -O -h -s 'defdim("time",1);time[time]='$TAU';time@long_name="Time";time@calendar="standard";time@units="hours since 2009-01-01 00:00:00"' $IFILE $OFILE

# Make time dimension unlimited 
ncks -h -O --mk_rec time $OFILE tmp.nc
mv tmp.nc $OFILE

# Add time dimension to emission field
ncwa -a time $OFILE tmp.nc
ncecat -u time tmp.nc $OFILE
rm tmp.nc

exit 0