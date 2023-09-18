#!/usr/bin/env python

import os
import xarray as xr
import numpy as np

# Specify file path and file names
outfile= 'Emission_totals.txt'
rundir = '/n/scratchlfs/jacob_lab/msulprizio/GC/rundirs/12.4.0_Tests/HEMCO_Standalone/geosfp_4x5_OfflineDust'
files  = 'output/HEMCO_sa.diagnostics.*.nc'
path = os.path.join(rundir, files)

sec_in_year = 365.0 * 86400.0

# Load the netCDF files into an xarray dataset
ds = xr.open_mfdataset(path)

# Extract the grid box surface area values f(in units of m^2) 
# from the xarray Dataset object into a numpy array.
# This is done by using with the .values tag.
area = ds['AREA'].values

# List of all variables in the xarray object.
# This will include the index arrays (lon,lat,time) and also the AREA variable.
varlist = ds.data_vars.keys()

# Restrict the list of variables to only those containing emissions data.
# (i.e. those that have at least 3 dimensions (e.g. time,lat.lon).
# To manipulate a list, we have to use the "v for v in varlist if ..." syntax.
varlist = [v for v in varlist if ds[v].ndim > 2  ]

# Open file for output
f = open(outfile, "w")

# Write header to file
title1 = '### Emission totals'
f.write("#"*79)
f.write("\n{}{}\n".format(title1.ljust(76), "###"))
f.write("#"*79)
f.write("\n")

for name in varlist:

    if name == 'AREA':
        continue
    
    # Extract the data from the "ds" xarray object into a numpy array object.
    emissions_array = ds[name].values
    
    # Convert the emissions data from kg/m2/s to Tg and take the sum
    emissions_array = emissions_array * area * sec_in_year
    emissions_sum = np.sum( emissions_array )/ 1.0e9
    
    # Print the emissions total
    f.write( "{n} sum = {es:13.6f}  {u}\n".format( n=name.ljust(15), es=emissions_sum, u='Tg' ) )

# Close file
f.close()
