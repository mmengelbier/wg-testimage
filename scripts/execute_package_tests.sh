#! /bin/bash

# execute package tests
#
#
#

# -- some references
WRK=/tmp



# -- identify packages
SPECS=$(/opt/r-repo-wg/scripts/committed_files.sh | tr ' '  '\n' | grep "^packages/" )

if [ -z ${SPECS} ]; then
  echo "No packages to process"
  exit 0
fi


# -- packages
SPECFILE=$(basename ${SPECS})

PKG=${SPECFILE%.*}

echo "${PKG}"


# -- create temporary area to work in
TMPLIB=${WRK}/${PKG}
mkdir -p ${TMPLIB}

# -- change working directory
cd $TMPLIB

# -- build new site library
RLIBS=${TMPLIB}:$(Rscript -e "cat( .Library.site, sep = \"\")")

echo "${RLIBS}"