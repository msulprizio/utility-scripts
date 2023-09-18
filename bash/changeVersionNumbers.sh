#!/bin/bash

#EOC
#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !MODULE: changeVersionNumbers.sh 
#
# !DESCRIPTION: Bash script to change the version numbers in the appropriate
#  files in GCClassic, GEOS-Chem, and HEMCO.  Use this before releasing
#  a new GEOS-Chem version.
#\\
#\\
# !CALLING SEQUENCE:
#  $ ./changeVersionNumbers X.Y.Z
#
# !REMARKS:
#  Calls the src/GEOS-Chem/release/changeVersionNumbers.sh and
#  /src/HEMCO/release/changeVersionNumbers.sh scripts.
#EOP
#------------------------------------------------------------------------------
#BOC

# Function to replace text in a file
function replace() {
    sed -i -e "s/${1}/${2}/" "${3}"
}

#-----------------------------------------------------------------------------

# Display and error message and exit
function exitWithError() {
    echo "Could not update version numbers in ${1}... Exiting!"
    exit 1
}

#-----------------------------------------------------------------------------

# Expect 1 arguments, or exit with error
if [[ $# -ne 1 ]]; then
    echo "Usage: ./changeVersionNumbers.sh VERSION"
    exit 1
fi

# New version number
version="${1}"

# Directories
thisDir=$(pwd -P)
cd ..
rootDir=$(pwd -P)

# Pattern to match: X.Y.Z
pattern='[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*'

# List of files to replace 
files=(                         \
  "CMakeLists.txt"              \
  "docs/source/conf.py"         \
  "src/Core/hco_error_mod.F90"
)

# Replace version numbers in files
for file in $files[@]; do
    replace "${pattern}" "${version}" "${file}"
    [[ $? -ne 0 ]] && exitWithError "${file}"
done

# Return to the starting directory
cd "${thisDir}"

# Exit normally
exit 0
