# python script to change variable short names and units in a NetCDF file.
# The NetCDF file path is passed an argument to this script. If using on
# Odyssey, do "module load nco" prior to use.
#
# Lizzie Lundgren
# 22 February 2016
#

import os
import sys

ncpath = sys.argv[1]
fpath = "./ncdump.txt"
old_prefix = "SPC_"
new_prefix = "SpeciesConc_"

# open ncdump.txt to read
with open(fpath) as f:

    # loop over lines in file
    for line in f:

       # Skip lines that do not contain the tracer variable definition 
       if "float" not in line:
           continue
       if "SPC_" not in line:
           continue

       # Parse the line to get the tracer name 
       linearr = line.split()             # split line by space
       tmpstr = linearr[1]                # take second string
       tmparr = tmpstr.split('(')         # split string by (
       bpch_var = tmparr[0]               # take first string (bpch var name)
       tmparr2 = bpch_var.split("_")     # split string by __ (two of them)
       tracer_name = tmparr2[1]           # take second string (tracer name)

       # Set the bpch and netcdf variable names to use with NCO
       oldvar = old_prefix + tracer_name  # old_var = old_prefix + tracername
       newvar = new_prefix + tracer_name  # new_var = new_prefix + tracername

       # Sanity check
       print "\nOld variable name: " + oldvar
       print "New variable name: " + newvar
       
       # define shell commands to update varname and units in file
       bashCmd1 = "ncrename -h -O -v "+oldvar+","+newvar+" "+ncpath
       bashCmd2 = "ncatted -h -a units," +newvar+',o,c,mol/mol ' + ncpath
       
       # Call shell commands
       print "Calling NCO commands..."
       os.system(bashCmd1)
       os.system(bashCmd2)
       print "NCO operations complete."

## If dummy variables were added to tracerinfo.dat, delete them here
#numdum = 4
#print "\nDeleting dummy variables..."
#
#for i in range(numdum-1):
#    num1 = 2*i + 1
#    num2 = 2*i + 2
#    bashCmdx1 = "ncks -h -C -O -x -v IJ_AVG_S__DUM" + str(num1) + " " + ncpath + " temp.nc"
#    bashCmdx2 = "ncks -h -C -O -x -v IJ_AVG_S__DUM" + str(num2) + " temp.nc " + ncpath
#    os.system(bashCmdx1)
#    os.system(bashCmdx2)
#bashCmdEnd = "rm temp.nc"    
#os.system(bashCmdEnd)
#print "Deletion complete."
       
exit(0)
