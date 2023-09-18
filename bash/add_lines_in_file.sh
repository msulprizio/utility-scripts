#!/bin/bash

# Adds a new line to the input.geos.template files (mps, 6/25/15)

# Previous line
PREV="FullName      ="

# New line
NEW="\                              Formula       = '', &"

# Input file
INFILE="species_database_mod.F90"

if [[ -f "$INFILE" ]]; then
 echo "Adding line to $dir/$INFILE"
 sed -i "/$PREV/a $NEW" $INFILE
fi


done
