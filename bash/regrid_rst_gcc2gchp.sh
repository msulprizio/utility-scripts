#!/bin/bash

# Regrid a GCClassic restart file to a GCHP cube-sphere restart file
#
# Calling sequence:
# regrid_rst_gcc2gchp.sh {FILE-PREFIX} {CS-RESOLUTION}
#
# Example:
# regrid_rst_gcc2gchp.sh GEOSChem.Restart.20190101_0000z 24

fin=$1
cs_res=$2

conda activate gcpy_env

python -m gcpy.file_regrid --filein ${prefix}.nc4 \
       --dim_forma{t_in classic \
       --fileout ${prefix}.c${cs_res}.nc4 \
       --cs_res_out ${cs_res} \
       --dim_format_out checkpoint

conda deactivate

exit 0
