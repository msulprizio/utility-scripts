# python script to change variable short names in a NetCDF file, specifically
# for GCC restart prefix (SpeciesRst) to GCHP restart prefix (SPC).
# The NetCDF file path is passed an argument to this script. This script
# requires nco.
#
# Lizzie Lundgren
# 03 January 2018

import os
import sys

ncpath = sys.argv[1]
fpath = "./ncdump.txt"
old_prefix = "SpeciesConc_"
new_prefix = "SpeciesConcVV_"

# open ncdump.txt to read
with open(fpath) as f:

    # loop over lines in file
    for line in f:

       # Skip lines that do not contain the tracer variable definition 
       if "float" not in line:
           continue
       if old_prefix not in line:
           continue

       # Parse the line to get the tracer name 
       linearr = line.split()             # split line by space
       tmpstr = linearr[1]                # take second string
       tmparr = tmpstr.split('(')         # split string by (
       bpch_var = tmparr[0]               # take first string (bpch var name)
       tmparr2 = bpch_var.split("_")     # split string by _
       tracer_name = tmparr2[1]           # take second string (tracer name)

       # Set the old and new variable names to use with NCO
       oldvar = old_prefix + tracer_name  # old_var = old_prefix + tracername
       newvar = new_prefix + tracer_name  # new_var = new_prefix + tracername

       # Sanity check
       print('\nOld variable name: {}'.format(oldvar))
       print('New variable name: {}'.format(newvar))
       
       # define shell commands to update varname in file
       bashCmd1 = "ncrename -h -O -v "+oldvar+","+newvar+" "+ncpath
       
       # Call shell commands
       print('Calling NCO commands...')
       os.system(bashCmd1)
       print('NCO operations complete.')
       
exit(0)
