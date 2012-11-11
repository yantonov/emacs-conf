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

CURRENT_DIR=`dirname $0`
UTIL_DIR="${CURRENT_DIR}/shell-util"
WD=`pwd`
cd $UTIL_DIR
UTIL_DIR=`pwd`
cd $WD
EMACS_HOME=`${UTIL_DIR}/emacs-home.sh`
EMACS_MODE_HOME=`${UTIL_DIR}/emacs-mode-home.sh`

# run

cd ${EMACS_MODE_HOME}
`${UTIL_DIR}/mkdir.sh ${INSTALLED_MODE_DIR}`
cd ${INSTALLED_MODE_DIR}

rm -rf *
wget ${INSTALLED_MODE_EL_FILE_URL}