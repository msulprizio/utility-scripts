#!/bin/bash

# Removes a line from the input.geos.template files (mps, 5/5/16)

# Line to remove
LINE="USE solver coded by KPP : F"

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
         echo "Removing line from $dir/$INFILE1"
	 sed "/$LINE/d" $INFILE1 > tmp.txt
	 mv tmp.txt $INFILE1
         echo "Removing line from $dir/$INFILE2"
	 sed "/$LINE/d" $INFILE2 > tmp.txt
	 mv tmp.txt $INFILE2
         echo "Removing line from $dir/$INFILE3"
	 sed "/$LINE/d" $INFILE3 > tmp.txt
	 mv tmp.txt $INFILE3
      elif [[ -f "$INFILE" ]]; then
         echo "Removing line from $dir/$INFILE"
         sed "/$LINE/d" $INFILE > tmp.txt
	 mv tmp.txt $INFILE
      fi

      # Change back
      cd ..

   fi

done
