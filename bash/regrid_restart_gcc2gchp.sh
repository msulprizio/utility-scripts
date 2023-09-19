#!/bin/bash

# Regrid a GCClassic restart file to a GCHP cube-sphere restart file
#
# Calling sequence:
# regrid_rst_gcc2gchp.sh {FILE-PREFIX} {CS-RESOLUTION}
#
# Example:
# regrid_rst_gcc2gchp.sh GEOSChem.Restart.20190101_0000z 24

if [[ $# == 2 ]] ; then
    prefix=$1
    cs_res=$2
else
    echo "Usage: ./regrid_rst_gcc2gchp.sh {FILE-PREFIX} {CS-RESOLUTION}"
    exit 1
fi

#mamba activate gcpy_env

python -m gcpy.file_regrid --filein ${prefix}.nc4 \
       --dim_format_in classic \
       --fileout ${prefix}.c${cs_res}.nc4 \
       --cs_res_out ${cs_res} \
       --dim_format_out checkpoint

# Remove regridding files
rm -rf conservative_*.nc

#mamba deactivate

exit 0
