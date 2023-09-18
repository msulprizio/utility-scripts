#!/bin/bash

# Updates the nested-grid menu with extra offsets (bmy, 4/16/15)

# Old text
OLD="{DATA_ROOT}/SPC_RESTARTS/initial_GEOSChem_rst.*.nc"

# New text
NEW="GEOSChem_restart.YYYYMMDDhhmm.nc"

# Input file
INFILE="input.geos.template"
POPSFILE='input.geos.template.PHE'

# Temp file
TEMP="temp.txt"

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
         if grep -q "$OLD" "$INFILE1"; then
            echo "Replacing text in $dir/$INFILE1"
            sed "s@$OLD@$NEW@g" "$INFILE1" > $TEMP && mv $TEMP "$INFILE1"
         fi
         if grep -q "$OLD" "$INFILE2"; then
            echo "Replacing text in $dir/$INFILE2"
            sed "s@$OLD@$NEW@g" "$INFILE2" > $TEMP && mv $TEMP "$INFILE2"
         fi
         if grep -q "$OLD" "$INFILE3"; then
            echo "Replacing text in $dir/$INFILE3"
            sed "s@$OLD@$NEW@g" "$INFILE3" > $TEMP && mv $TEMP "$INFILE3"
         fi
      elif [[ -f "$INFILE" ]]; then
         if grep -q "$OLD" "$INFILE"; then
            echo "Replacing text in $dir/$INFILE"
            sed "s@$OLD@$NEW@g" "$INFILE" > $TEMP && mv $TEMP "$INFILE"
	 fi
      fi

      # Change back
      cd ..

   fi

done
