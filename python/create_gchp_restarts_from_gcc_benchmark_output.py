#!/usr/bin/env python

'''This python script created GCHP restart files from GEOS-Chem Classic restart
files generated during 1-month and 1-year benchmarking.'''

import gcpy

weightsdir= '/n/home08/elundgren/holyscratch01/weights'
gchp_res = [24, 30, 48, 90, 180]

# Function to regrid given simulation, date, and target gchp resolution
def gcc_to_gchp_rst(sim,date,res):
    print('Simulation: {}, Date: {}, Resolution: {}'.format(sim,date,res))
    gcpy.file_regrid(
        './GEOSChem.Restart.{}.{}_0000z.nc4'.format(sim,date),
        './GEOSChem.Restart.{}.{}_0000z.c{}.nc4'.format(sim,date,res),
        'classic',
        'checkpoint',
        cs_res_out=res,
        weightsdir=weightsdir
    )

for res in gchp_res:
    print('Creating GCHP restart files for c{}'.format(res))
    gcc_to_gchp_rst('fullchem','20190701',res)
    gcc_to_gchp_rst('fullchem','20190101',res)
    gcc_to_gchp_rst('TransportTracers','20190101',res)
    
