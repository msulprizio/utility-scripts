#!/bin/bash

# Removes a line from the input.geos.template files (mps, 5/5/16)

# Line to remove
LINE1="Transport Timestep \[min\]: 10"
LINE2="Convect Timestep \[min\]  : 10"
LINE3="Emiss Timestep \[min\]    : 20"
LINE4="Chemistry Timestep \[min\]: 20"

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
	 sed "/$LINE1/d" $INFILE1 > tmp.txt
	 mv tmp.txt $INFILE1
	 sed "/$LINE2/d" $INFILE1 > tmp.txt
	 mv tmp.txt $INFILE1
	 sed "/$LINE3/d" $INFILE1 > tmp.txt
	 mv tmp.txt $INFILE1
	 sed "/$LINE4/d" $INFILE1 > tmp.txt
	 mv tmp.txt $INFILE1
         echo "Removing line from $dir/$INFILE2"
	 sed "/$LINE1/d" $INFILE2 > tmp.txt
	 mv tmp.txt $INFILE2
	 sed "/$LINE2/d" $INFILE2 > tmp.txt
	 mv tmp.txt $INFILE2
	 sed "/$LINE3/d" $INFILE2 > tmp.txt
	 mv tmp.txt $INFILE2
	 sed "/$LINE4/d" $INFILE2 > tmp.txt
	 mv tmp.txt $INFILE2
         echo "Removing line from $dir/$INFILE3"
	 sed "/$LINE1/d" $INFILE3 > tmp.txt
	 mv tmp.txt $INFILE3
	 sed "/$LINE2/d" $INFILE3 > tmp.txt
	 mv tmp.txt $INFILE3
	 sed "/$LINE3/d" $INFILE3 > tmp.txt
	 mv tmp.txt $INFILE3
	 sed "/$LINE4/d" $INFILE3 > tmp.txt
	 mv tmp.txt $INFILE3
      elif [[ -f "$INFILE" ]]; then
         echo "Removing line from $dir/$INFILE"
         sed "/${LINE1}/d" $INFILE > tmp.txt
	 mv tmp.txt $INFILE
         sed "/$LINE2/d" $INFILE > tmp.txt
	 mv tmp.txt $INFILE
         sed "/$LINE3/d" $INFILE > tmp.txt
	 mv tmp.txt $INFILE
         sed "/$LINE4/d" $INFILE > tmp.txt
	 mv tmp.txt $INFILE
      fi

      # Change back
      cd ..

   fi

done
