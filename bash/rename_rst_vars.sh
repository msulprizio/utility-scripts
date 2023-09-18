#!/bin/bash

# Load modules
#module load cdo
#module load nco

InFile='GEOSChem.Restart.20190101_0000z.nc4'

ncrename -h -v SpeciesRst_SHEmis90dayTracer,SpeciesRst_e90_s $InFile
ncrename -h -v SpeciesRst_NHEmis90dayTracer,SpeciesRst_e90_n $InFile
ncrename -h -v SpeciesRst_GlobEmis90dayTracer,SpeciesRst_e90 $InFile
ncrename -h -v SpeciesRst_COAnthroEmis25dayTracer,SpeciesRst_CO_25 $InFile
ncrename -h -v SpeciesRst_COAnthroEmis50dayTracer,SpeciesRst_CO_50 $InFile
ncrename -h -v SpeciesRst_CH3ITracer,SpeciesRst_CH3I $InFile
ncrename -h -v SpeciesRst_SF6Tracer,SpeciesRst_SF6 $InFile
ncrename -h -v SpeciesRst_Be10Strat,SpeciesRst_Be10s $InFile
ncrename -h -v SpeciesRst_Be7Strat,SpeciesRst_Be7s $InFile
ncrename -h -v SpeciesRst_Pb210Strat,SpeciesRst_Pb210s $InFile

ncks -h -x -v SpeciesRst_CLOCK GEOSChem.Restart.20190101_0000z.nc4 tmp.nc
ncks -h -x -v SpeciesRst_COUniformEmis25dayTracer tmp.nc $InFile

exit 0
