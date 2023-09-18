# This loops over files and calls change_varname.py to rename SpeciesConc_
# to SpeciesConcVV

for file in GEOSChem.SpeciesConc*; do

    ## Rename SpeciesConc_ to SpeciesConcVV_ for comparison of pre-14.0.0 files
    ## with more recent versions
    ncdump $file -h > ncdump.txt
    python change_varname.py $file
    rm ncdump.txt

done
