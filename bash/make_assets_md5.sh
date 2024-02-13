#!/bin/bash

#=============================================================================
# Creates an .assets.md5 file for compatibility with bashdatacatalog.
#
# Example: ./make_assets_md5.sh /path/to/extData/HEMCO/TIMEZONES/v2024-02
#=============================================================================

# Make sure an argument is passed
if [[ "x${1}" == "x" ]]; then
    echo "Usage: ./make_assets_md5.sh /path/to/data/dir"
fi

# Full path of the original data
origDir=$(pwd -P)

# Navigate to the data folder
cd "${1}"

# Get the full path and basename of the data directory
dataDir=$(pwd -P)
dataDirBaseName=$(basename "$dataDir")

# Remove any pre-existing .assets.md5 file
[[ -f .assets.md5 ]] && rm -rf .assets.md5

# Navigate one level up
cd ..

# Loop over files in the data directory
for file in ${dataDirBaseName}/*; do

    # Only process data files (skip directories etc.)
    if [[ -f "${file}" ]]; then

        # Take the md5sum and add it to the .assets.md5 file in the
	# basename folder.  Create .assets.md5 file if it doesn't exist.
	# Skip processing the .assets.md5 file or this script.
        if [[ "${file}" =~ "assets" ]]; then
            continue
        else
	    if [[ -f .assets.md5 ]]; then
                md5sum "${file}" >> "${dataDirBaseName}/.assets.md5"
            else
                md5sum "${file}" > "${dataDirBaseName}/.assets.md5"
	    fi
        fi
    fi
done    

# Navigate back to the data directory amd replace the basename w/ "*./",
# which is the format that is compatible with bashdatacatalog
cd $dataDir
sed -i -e "s/${dataDirBaseName}/\*\./g" .assets.md5

echo "Contents of $dataDir/.assets.md5"
cat .assets.md5

cd $origDir




