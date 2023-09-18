#!/usr/bin/python

# Python script to compare species values per grid box before and after
# chemistry using FlexChem debug output to logs (ref and dev). Only data
# for the last timestep are compared.
# 
# Pass two arguments to this script:
#  arg 1: ref logfile path
#  arg 2: dev logfile path
# 
# Example call:
#  ./SpecDiff.py ./geosfp_4x5_soa.ref/log ./geosfp_4x5_soa.dev/log > soaDiff.txt
#
# Lizzie Lundgren, 3/23/16

import os
import sys
import numpy as np

# Read arguments into ref and dev log path variables
reflogpath = str(sys.argv[1])
devlogpath = str(sys.argv[2])

# log file strings of interest
before_indicator = "<> b "
after_indicator = "<> a "
meanOH_indicator = "Mean OH ="
timestep_indicator = "- Found all 44 GEOS-FP A1"

# Declare arrays (will just append rather than set size in advance)
spc_b_dev=dict()
spc_b_ref=dict()
spc_a_dev=dict()
spc_a_ref=dict()
meanOH=[]
dev_but_not_ref=[]
ref_but_not_dev=[]

# open dev log file to grab various outputs
with open(devlogpath) as f:

    # loop over lines in dev file
    for line in reversed(f.readlines()):

        # store before concentrations
        if before_indicator in line:
            linearr = line.split()              # split line by space
            spc_b_dev[linearr[2]] = linearr[3]  # 2nd is name, 3rd is value

        # store after concentrations
        if after_indicator in line:
            linearr = line.split()
            spc_a_dev[linearr[2]] = linearr[3]

        # Grab mean OH at end of log file (Dev)
        if meanOH_indicator in line:
            linearr = line.split()
            meanOH.append(linearr[3])

        # Stop looping if you reach the start of the timestep
        if timestep_indicator in line:
            break

# open ref log file to grab various outputs
with open(reflogpath) as f:

    # loop over lines in ref file
    for line in reversed(f.readlines()):

        # store before concentrations
        if before_indicator in line:
            linearr = line.split()              # split line by space
            spc_b_ref[linearr[2]] = linearr[3]  # 2nd is name, 3rd is value

        # store after concentrations
        if after_indicator in line:
            linearr = line.split()
            spc_a_ref[linearr[2]] = linearr[3]

        # Grab mean OH at end of log file (Ref)
        if meanOH_indicator in line:
            linearr = line.split()
            meanOH.append(linearr[3])

        # Stop looping if you reach the start of the timestep
        if timestep_indicator in line:
            break

# get ref_but_not_dev
for key in spc_b_ref:
    if key not in spc_b_dev:
        ref_but_not_dev.append(key)

# get dev_but_not_ref
for key in spc_b_dev:
    if key not in spc_b_ref:
        dev_but_not_ref.append(key)

################################
# print species that do not overlap between ref and dev
################################

print "%s %s" % ("Ref log:", reflogpath)
print "%s %s" % ("Dev log:", devlogpath)

print "\n%s" % ("Species in DEV but not REF:")
print dev_but_not_ref
print "\n%s" % ("Species in REF but not DEV:")
print ref_but_not_dev

################################
# print dev before vs ref before
################################

print " "
print "%" * 40
print "%s" % ('REF BEFORE vs DEV BEFORE (molec/cm3)')
print "%" * 40
print "%-10s %12s %12s %12s %12s" % \
            ('Species','Ref before','Dev before','Diff (D-R)','Ratio (D/R)')
# loop over keys in dev before dictionary
for key in spc_b_dev:
    # check if key in ref before dictionary
    if key in spc_b_ref:
        # if yes, calculate stats and print values and stats
        diff = float( spc_b_dev.get(key) ) - float( spc_b_ref.get(key) )
        if float( spc_b_ref.get(key) ) != 0:
            ratio = float( spc_b_dev.get(key) ) / float( spc_b_ref.get(key) )
        else:
            ratio = np.NaN
        print "%-10s %12s %12s %12.3e %12.6f" % \
            (key, spc_b_ref.get(key), spc_b_dev.get(key), diff, ratio)

################################
# print dev after vs ref after
################################

print " "
print "%" * 40
print "%s" % ('REF AFTER vs DEV AFTER (molec/cm3)')
print "%" * 40
print "%-10s %12s %12s %12s %12s" % \
            ('Species','Ref after','Dev after','Diff (D-R)','Ratio (D/R)')
# loop over keys in dev before dictionary
for key in spc_a_dev:
    # check if key in ref before dictionary
    if key in spc_a_ref:
        # if yes, calculate stats and print values and stats
        diff = float( spc_a_dev.get(key) ) - float( spc_a_ref.get(key) )
        if float( spc_a_ref.get(key) ) != 0:
            ratio = float( spc_a_dev.get(key) ) / float( spc_a_ref.get(key) )
        else:
            ratio = np.NaN
        print "%-10s %12s %12s %12.3e %12.6f" % \
            (key, spc_a_ref.get(key), spc_a_dev.get(key), diff, ratio)

################################
# print ref before vs ref after
################################

print " "
print "%" * 40
print "%s" % ('REF BEFORE vs REF AFTER (molec/cm3)')
print "%" * 40
print "%-10s %12s %12s %12s %12s" % \
            ('Species','Ref before','Ref after','Diff (A-B)','Ratio (A/B)')
# loop over keys in ref before dictionary
for key in spc_b_ref:
    diff = float( spc_a_ref.get(key) ) - float( spc_b_ref.get(key) )
    if float( spc_b_ref.get(key) ) != 0:
        ratio = float( spc_a_ref.get(key) ) / float( spc_b_ref.get(key) )
    else:
        ratio = np.NaN
    print "%-10s %12s %12s %12.3e %12.6f" % \
          (key, spc_b_ref.get(key), spc_a_ref.get(key), diff, ratio)

################################
# print dev before vs dev after
################################

print " "
print "%" * 40
print "%s" % ('DEV BEFORE vs DEV AFTER (molec/cm3)')
print "%" * 40
print "%-10s %12s %12s %12s %12s" % \
            ('Species','Dev before','Dev after','Diff (A-B)','Ratio (A/B)')
# loop over keys in dev before dictionary
for key in spc_b_dev:
    diff = float( spc_a_dev.get(key) ) - float( spc_b_dev.get(key) )
    if float( spc_b_dev.get(key) ) != 0:
        ratio = float( spc_a_dev.get(key) ) / float( spc_b_dev.get(key) )
    else:
        ratio = np.NaN
    print "%-10s %12s %12s %12.3e %12.6f" % \
          (key, spc_b_dev.get(key), spc_a_dev.get(key), diff, ratio)

################################
# print mean OH
################################
print " "
print "%" * 40
print "%s" % ('MEAN OH COMPARISON [1e5 molec/cm3]')
print "%" * 40
print "%-6s %-20s" % ("Ref:", meanOH[1])
print "%-6s %-20s" % ("Dev:", meanOH[0])
