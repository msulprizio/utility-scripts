#!/bin/bash

for file in *nc; do

 #echo "Compressing $file"
 #nccopy -d1 $file tmp.nc
 #mv tmp.nc $file

 # Now use Bob's nc_chunk.pl script and pass deflation level=1
 nc_chunk.pl $file 1
    
done
