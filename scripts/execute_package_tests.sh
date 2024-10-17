#! /bin/bash

# execute package tests
#
#
#


# -- identify packages
SPECS=$(/opt/r-repo-wg/scripts/committed_files.sh | tr ' '  '\n' | grep "^packages/" )

if [ -z ${SPECS} ]; then
  echo "No packages to process"
  exit 0
fi


# -- packages
SPECFILE=$(basename ${SPECS})
echo "${SPECFILE%.*}"