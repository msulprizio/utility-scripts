#!/bin/bash

# This script will download 0.5x0.625 degree global MERRA-2 meteorogical
# files in netCDF format and crop them to a user-defined region. Once files
# have been cropped, the global files may be removed to free up disk space
# using the RemoveGlobalMet option.

##############################################################################
# Custom to Harvard FAS RC cluster:
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 0-30:00
#SBATCH -p huce_cascade
#SBATCH --mem=2000
#SBATCH --mail-type=END

# Load modules for CDO
module load intel/17.0.4-fasrc01
module load cdo/1.9.4-fasrc02
##############################################################################

##############################################################################
# USER SETTINGS:
##############################################################################

# Create a 2-letter region ID (e.g. NA=North America, EU=Europe, AS=Asia)
NestedRegion="AF"  # Africa

# Bounds of the cropped domain
LonMin=-20.0
LonMax=55.0
LatMin=-37.0
LatMax=40.0

# Directory containing global met fields
DownloadGlobalMet=true
RemoveGlobalMet=false
#GlobalDir="/n/holyscratch01/external_repos/GEOS-CHEM/gcgrid/gcdata/ExtData/GEOS_0.5x0.625/MERRA2"
GlobalDir="/n/holyscratch01/jacob_lab/msulprizio/MET/GEOS_0.5x0.625/MERRA2"

# Directory for storing cropped met fields
RegionalDir="/n/holyscratch01/jacob_lab/msulprizio/MET/GEOS_0.5x0.625_${NestedRegion}/MERRA2"

# Download and crop constant meteorology fields? This file is required
# by GEOS-Chem, but only needs to be processed once per region (i.e. set
# to false upon subsequent executions of this script)
ProcessConstantFields=false

# Dates to process
Year=2022
StartMonth=1
EndMonth=12

##############################################################################
# Routine crop_met begins here!
##############################################################################

# Create directories if they don't already exist
if [[ ! -d $GlobalDir/$Year ]] ; then
    mkdir -p -v $GlobalDir
fi
if [[ ! -d $RegionalDir/$Year ]] ; then
    mkdir -p -v $RegionalDir/$Year
fi

# Download and crop constant met fields
# For 0.5x0.625 MERRA-2 meteorology, the timestamp of these fields is 20150101
if "$ProcessConstantFields"; then
    wget -r -nH --cut-dirs=3 -e robots=off -q -P "${GlobalDir}" "http://geoschemdata.wustl.edu/ExtData/GEOS_0.5x0.625/MERRA2/2015/01/MERRA2.20150101.CN.05x0625.nc4"
    mkdir -p -v $RegionalDir/2015/01
    cdo --no_history sellonlatbox,$LonMin,$LonMax,$LatMin,$LatMax ${GlobalDir}/2015/01/MERRA2.20150101.CN.05x0625.nc4 ${RegionalDir}/2015/01/MERRA2.20150101.CN.05x0625.${NestedRegion}.nc4
fi

# Loop over months
for (( Month=$StartMonth; Month<=$EndMonth; Month++)); do

    # Set mm string
    if (( $Month < 10 )); then
        mm="0${Month}"
    else
        mm="${Month}"
    fi
    
    printf "Processing month $mm\n"

    # Download global meteorology fields for this month
    if "$DownloadGlobalMet"; then
	printf "Downloading global meteorology files for ${Year}/${mm}\n"
	wget -r -np -nH --cut-dirs=3 -e robots=off -nv -o "download_met.log" -P "${GlobalDir}" -A "*.nc4" "http://geoschemdata.wustl.edu/ExtData/GEOS_0.5x0.625/MERRA2/${Year}/${mm}/"
	printf "Done downloading global meteorology files\n"
    fi
    # Path to global files
    InPath="${GlobalDir}/${Year}/${mm}"

    # Create directory if it doesn't exist
    if [[ ! -d $RegionalDir/$Year/$mm ]]; then
	mkdir -p -v $RegionalDir/$Year/$mm
    fi

    for file in $InPath/*.nc4*; do

	# Output filename
	fOut=${file##*/}                   # Remove input path
	fOut=${fOut%.*}                    # Remove file suffix
	fOut=${fOut}.${NestedRegion}.nc4   # Append region ID
	fOut=$RegionalDir/$Year/$mm/$fOut  # Prepend output file path

	echo $fOut

	# Crop global files
	cdo --no_history sellonlatbox,$LonMin,$LonMax,$LatMin,$LatMax $file $fOut 
	# Chunk and compress (deflate level=5) files
	nc_chunk.pl $fOut 5
	
    done

    # Download global met fields for this month
    if "$RemoveGlobalMet"; then
	rm -rf $InPath
    fi

    echo "Done"
    
done
