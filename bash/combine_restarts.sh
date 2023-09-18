#!/bin/bash

#
# Adds species from various BPCH restart files to netCDF restart files
#
# Melissa Sulprizio, 7/24/17
#
#
# Assumes original BPCH restart files have already been converted to NC using:
#   For regridding original 47-lev BPCH files to 72-lev for standard sims
#   IDL> regridv_restart, infilename='file', outfilename='file.72L', $
#        outmodelname='GEOSFP'
#
#   To convert to netCDF need to modify filenames in createNetCDF.sh then run
#

# Load modules
module load cdo
module load nco

# Resolution
#Res='4x5'
Res='2x25'

# Simulation type
Sim='standard'
#Sim='standard'

# Get EOH from Emily's PAN restart file
InFile='initial_GEOSChem_restart.geosfp_'$Res'_'$Sim'.wPAN.nc'
cdo selvar,SPC_EOH $InFile GEOSChem_restart.EOH.nc

# Get species from SEAC4RS restart file
InFile='initial_GEOSChem_restart.geosfp_'$Res'_'$Sim'.wIsopChem.nc'
cdo selvar,SPC_ETHLN,SPC_ISN1,SPC_MGLY,SPC_GLYX,SPC_HCOOH,SPC_ACTA,SPC_DHDN,SPC_ONITAam,SPC_ONITApm,SPC_HPALD,SPC_API,SPC_LIM,SPC_HONIT $InFile GEOSChem_restart.isopChem.nc
ncrename -h -v SPC_ONITAam,SPC_IONITA GEOSChem_restart.isopChem.nc
ncrename -h -v SPC_ONITApm,SPC_MONITA GEOSChem_restart.isopChem.nc
ncrename -h -v SPC_API,SPC_MTPA       GEOSChem_restart.isopChem.nc
ncrename -h -v SPC_LIM,SPC_LIMO       GEOSChem_restart.isopChem.nc
cdo selvar,SPC_MONIT $InFile GEOSChem_restart.MONIT.nc
ncrename -h -v SPC_MONIT,SPC_MONITS   GEOSChem_restart.MONIT.nc GEOSChem_restart.MONITS.nc
ncrename -h -v SPC_MONIT,SPC_MONITU   GEOSChem_restart.MONIT.nc GEOSChem_restart.MONITU.nc

# Get species from Eloise's ISOP SOA restart file
InFile='initial_GEOSChem_restart.geosfp_'$Res'_'$Sim'.wIsopSOA.nc'
cdo selvar,SPC_IPMN,SPC_IMAE,SPC_SOAIE,SPC_SOAME,SPC_INDIOL,SPC_SOAGX,SPC_SOAMG,SPC_LVOC,SPC_LVOCOA,SPC_ISN1OG,SPC_ISN1OA,SPC_HC187,SPC_BENZ,SPC_TOLU,SPC_XYLE $InFile GEOSChem_restart.isopSOA.nc

# Define input file for rest of operatons
InFile='initial_GEOSChem_rst.'$Res'_'$Sim'.nc'

# Rename PMN to NPMN and keep PMN for backwards compatibility
InFile='initial_GEOSChem_rst.'$Res'_'$Sim'.nc'
cdo selvar,SPC_PMN $InFile GEOSChem_restart.PMN.nc
ncrename -h -v SPC_PMN,SPC_NPMN GEOSChem_restart.PMN.nc GEOSChem_restart.NPMN.nc

# Rename IEPOX to IEPOXA,B,D and keep IEPOX for backwards compatibility
cdo selvar,SPC_IEPOX $InFile GEOSChem_restart.IEPOX.nc
ncrename -h -v SPC_IEPOX,SPC_IEPOXA GEOSChem_restart.IEPOX.nc GEOSChem_restart.IEPOXA.nc
ncrename -h -v SPC_IEPOX,SPC_IEPOXB GEOSChem_restart.IEPOX.nc GEOSChem_restart.IEPOXB.nc
ncrename -h -v SPC_IEPOX,SPC_IEPOXD GEOSChem_restart.IEPOX.nc GEOSChem_restart.IEPOXD.nc

# Rename RIP to RIPA,B,D and keep RIP for backwards compatibility
cdo selvar,SPC_RIP $InFile GEOSChem_restart.RIP.nc
ncrename -h -v SPC_RIP,SPC_RIPA GEOSChem_restart.RIP.nc GEOSChem_restart.RIPA.nc
ncrename -h -v SPC_RIP,SPC_RIPB GEOSChem_restart.RIP.nc GEOSChem_restart.RIPB.nc
ncrename -h -v SPC_RIP,SPC_RIPD GEOSChem_restart.RIP.nc GEOSChem_restart.RIPD.nc

# Append new species to existing restart file
cp $InFile $InFile.orig
ncks -h -A -M GEOSChem_restart.EOH.nc      $InFile
ncks -h -A -M GEOSChem_restart.NPMN.nc     $InFile
ncks -h -A -M GEOSChem_restart.IEPOXA.nc   $InFile
ncks -h -A -M GEOSChem_restart.IEPOXB.nc   $InFile
ncks -h -A -M GEOSChem_restart.IEPOXD.nc   $InFile
ncks -h -A -M GEOSChem_restart.RIPA.nc     $InFile
ncks -h -A -M GEOSChem_restart.RIPB.nc     $InFile
ncks -h -A -M GEOSChem_restart.RIPD.nc     $InFile
ncks -h -A -M GEOSChem_restart.isopChem.nc $InFile
ncks -h -A -M GEOSChem_restart.MONITS.nc   $InFile
ncks -h -A -M GEOSChem_restart.MONITU.nc   $InFile
ncks -h -A -M GEOSChem_restart.isopSOA.nc  $InFile

# Remove intermediate restart files
mv GEOSChem_restart.*.nc temp

exit 0