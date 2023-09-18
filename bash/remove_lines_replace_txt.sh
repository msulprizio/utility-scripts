#!/bin/bash

# Removes a line from the input.geos.template files (mps, 5/5/16)

# Line to remove

OLD=" 129       <--"
NEW=" 129       <--"

# Loop over all directories
for INFILE in *; do 

    # Replace text
    if [[ -f "$INFILE" ]]; then
        echo "Removing line from $INFILE"
        sed "/${LINE1}/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE2/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE3/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE4/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE5/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE6/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE7/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE8/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE9/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE
        sed "/$LINE0/d" $INFILE > tmp.txt
	mv tmp.txt $INFILE

        if grep -q "$OLD" "$INFILE"; then
          sed "s/$OLD/$NEW/g" "$INFILE" > tmp.txt && mv tmp.txt "$INFILE"
        fi

    fi

done
