#/bin/bash

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

CURRENT_DIR=`dirname $0`
UTIL_DIR="${CURRENT_DIR}/util"
WD=`pwd`
cd $UTIL_DIR
UTIL_DIR=`pwd`
cd $WD
EMACS_HOME=`${UTIL_DIR}/emacs-home.sh`
EMACS_MODE_HOME=`${UTIL_DIR}/emacs-mode-home.sh`

# run

cd ${EMACS_MODE_HOME}
rm -rf ${INSTALLED_MODE_DIR}
`${UTIL_DIR}/mkdir.sh ${INSTALLED_MODE_DIR}`
cd ${INSTALLED_MODE_DIR}

git clone ${GIT_REPO} .
