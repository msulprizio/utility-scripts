#!/usr/bin/env python

import xarray as xr
import matplotlib as plt
import gcpy

date  = "20170701"
name1 = "Emis2017"
name2 = "Emis2030alt"
file1 = "Run_025x03125_"+name1+"/OutputDir/GEOSChem.SpeciesConcMonthly."+date+"_0000z.nc4"
file2 = "Run_025x03125_"+name2+"/OutputDir/GEOSChem.SpeciesConcMonthly."+date+"_0000z.nc4"
varlist=['SpeciesConc_BCPI']

ds1 = xr.open_dataset(file1)
ds2 = xr.open_dataset(file2)

gcpy.compare_single_level( ds1, name1, ds2, name2, varlist=varlist, weightsdir='.', pdfname='' )

plt.pyplot.show()
