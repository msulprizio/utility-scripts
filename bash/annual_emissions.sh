#!/bin/bash

#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 0-2:00
#SBATCH -p huce_intel
#SBATCH --mem=8000

# Computes annual CH4 fluxes (Tg/yr)
#
# Melissa Sulprizio, March 24, 2017
#
# NOTES:
# Uses cdo fldsum to sums gridded annual emissions per grid cell and return 
# global sum
#  -gridarea calculates area of each grid cell (m2), multiply with the gridded
#    data using -mul
#  -timsum sums values over time (original file has monthly values)
#  -vertsum sums values over all levels
#  -mulc and -divc are used to convert units
#
# REFERENCES:
# CDO User's Guide: FLDSTAT - Statistical values over a field
#  https://code.zmaw.de/projects/cdo/embedded/cdo.pdf#subsection.2.8.6
#
# CDO User's Guide: TIMSTAT - Statistical values over all timesteps
#  https://code.zmaw.de/projects/cdo/embedded/cdo.pdf#subsection.2.8.15
#
# CDO User's Guide: VERTSTAT - Vertical statistical values
#  https://code.zmaw.de/projects/cdo/embedded/cdo.pdf#subsection.2.8.10


#--------------------------------------------------
# Initialize
#--------------------------------------------------

#module load cdo
#module load nco

## Constants for unit conversions
SECINYR=$((86400*365))

# Specify year
# To select all year specify YEAR=20
YEAR=2016

# Merge monthly files into one file
cdo mergetime HEMCO_sa.diagnostics.$YEAR*.nc HEMCO_sa.diagnostics.Merged.nc

cdo yearmean HEMCO_sa.diagnostics.Merged.nc HEMCO_sa.diagnostics.Annual.nc

#--------------------------------------------------
# Extract grid box areas
#--------------------------------------------------
cdo selvar,AREA HEMCO_sa.diagnostics.Annual.nc AREA.nc

#--------------------------------------------------
# Compute total emissions
#--------------------------------------------------

SPECIES=( "C2H6" "C3H8" )

for SPC in ${SPECIES[@]}; do

    # Select field
    cdo selvar,Emis${SPC}_Anthro HEMCO_sa.diagnostics.Annual.nc ${SPC}_kgm2s.nc
    cdo sellevidx,1 ${SPC}_kgm2s.nc tmp.nc
    mv tmp.nc ${SPC}_kgm2s.nc

    # Convert kg/m2/s -> Tg/yr
    cdo mul ${SPC}_kgm2s.nc AREA.nc ${SPC}_kgs.nc
    cdo fldsum -divc,1e9 -mulc,365 -mulc,86400 ${SPC}_kgs.nc ${SPC}_Total.nc
    ncatted -h -a units,Emis${SPC}_Anthro,o,c,'Tg' ${SPC}_Total.nc
    rm ${SPC}_kg*.nc 

done

exit 0
