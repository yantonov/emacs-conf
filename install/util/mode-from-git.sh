#!/bin/bash

# script install emacs mode (util, library) from given git repo

# Usage:
# first argument - git repo url
# second argument - dir name for library at emacs/mode

if [ $# -lt 2 ]; then
    echo "Usage: scriptname git_repo mod_dir_name"
    exit 0
else
    GIT_REPO=$1
    INSTALLED_MODE_DIR=$2
fi

# init env
SCRIPT_DIR=$(cd `dirname $0` && pwd)
EMACS_MODE_HOME=`${SCRIPT_DIR}/emacs-mode-home.sh`

# run

cd ${EMACS_MODE_HOME}
rm -rf ${INSTALLED_MODE_DIR}
mkdir -p ${INSTALLED_MODE_DIR}
cd ${INSTALLED_MODE_DIR}

git clone ${GIT_REPO} .
