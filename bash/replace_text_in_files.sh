#!/bin/bash

# Updates the nested-grid menu with extra offsets (bmy, 4/16/15)

# Old text
OLD="v11-02"

# New text
NEW="v11-02"

# Temp file
TEMP="temp.txt"

# Loop over all directories
for file in *; do 

      # Replace text
      if grep -q "$OLD" "$file"; then
          echo "Replacing text in $file"
          sed "s/$OLD/$NEW/g" "$file" > $TEMP && mv $TEMP "$file"
      fi

done
