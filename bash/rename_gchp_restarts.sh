#!/bin/bash

#============================================================================
# Renames GCHP restart files from:
#
#   gcchem_internal_checkpoint.YYYYMMDD_hhmmz.nc4
#
# to e.g.
#
#   GEOSChem.Restart.YYYYMMDD_hhmmz.c24.nc4
#
# Calling sequence:
#
# $ ./rename_gchp_restarts.sh       # Defaults to c24
# $ ./rename_gchp_restarts.sh 30    # Specify c30
# $ ./rename_gchp_restarts.sh 48    # Specify c48
# $ ./rename_gchp_restarts.sh 90    # Specify c90
#
# ... etc for other resolutions ...
#============================================================================

# Define the resolution string (defaults to c24 if not passed)
[[ "x${1}" != "x" ]] && res="c${1}" || res="c24"

# Rename files
for ifile in gcchem_internal_checkpoint*.nc4; do
    ofile="${ifile/gcchem_internal_checkpoint/GEOSChem.Restart}"
    ofile="${ofile/.nc4/.${res}.nc4}"
    mv "${ifile}" "${ofile}"
done
