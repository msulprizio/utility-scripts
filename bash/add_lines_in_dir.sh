#!/bin/bash

# Adds a new line to the input.geos.template files (mps, 6/25/15)

# Previous line
PREV="Global offsets I0, J0   : 0 0"

# New line
NEW="\------------------------+------------------------------------------------------\n%%% TIMESTEP MENU %%%   :\nTran/conv timestep [min]: 10\nChem/emis timestep [min]: 20"

# Input file
INFILE="input.geos.template"
POPSFILE='input.geos.template.PHE'

# Loop over all directories
for dir in *; do 

   if [[ -d $dir ]]; then 

      # Change to the directory
      cd $dir

      # Replace text
      if [[ -f "$POPSFILE" ]]; then
         # Special handling for POPs directories (3 files)
         INFILE1='input.geos.template.BaP'
         INFILE2='input.geos.template.PHE'
         INFILE3='input.geos.template.PYR'
         echo "Adding line from $dir/$INFILE1"
         sed -i "/$PREV/a $NEW" $INFILE1
         echo "Adding line from $dir/$INFILE2"
         sed -i "/$PREV/a $NEW" $INFILE2
         echo "Adding line from $dir/$INFILE3"
         sed -i "/$PREV/a $NEW" $INFILE3
      elif [[ -f "$INFILE" ]]; then
         echo "Adding line to $dir/$INFILE"
         sed -i "/$PREV/a $NEW" $INFILE
      fi

      # Change back
      cd ..

   fi

done
