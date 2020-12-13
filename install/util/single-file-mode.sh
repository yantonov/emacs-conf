#!/bin/bash

# script install single file

# Usage
# first argument - url
# second argument - mod_dir_name at emacs-home/mode

if [ $# -lt 2 ]; then
    echo "Usage: scriptname url_for_fileo mod_dir_name"
    exit 0
else
    INSTALLED_MODE_EL_FILE_URL=$1
    INSTALLED_MODE_DIR=$2
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EMACS_HOME=`${SCRIPT_DIR}/emacs-home.sh`
EMACS_MODE_HOME="$EMACS_HOME/mode"

# run

cd ${EMACS_MODE_HOME}
mkdir -p ${INSTALLED_MODE_DIR}
cd ${INSTALLED_MODE_DIR}

rm -rf *
curl -O ${INSTALLED_MODE_EL_FILE_URL}
