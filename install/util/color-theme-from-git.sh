#!/bin/bash

# script install color theme from given git repo

# Usage:
# first argument - git repo url
# second argument - dir name for color-theme

if [ $# -lt 2 ]; then
    echo "Usage: scriptname git_repo color_theme_dir_name"
    exit 0
else
    GIT_REPO=$1
    INSTALLED_THEME_DIR=$2
fi

# init env
WD=`pwd`
CURRENT_DIR=`dirname $0`
UTIL_DIR="${CURRENT_DIR}"
cd $UTIL_DIR
UTIL_DIR=`pwd`
EMACS_HOME=`${UTIL_DIR}/emacs-home.sh`
EMACS_COLOR_THEME_HOME=`${UTIL_DIR}/emacs-color-theme-home.sh`

# run

cd ${EMACS_COLOR_THEME_HOME}
rm -rf ${INSTALLED_THEME_DIR}
`${UTIL_DIR}/mkdir.sh ${INSTALLED_THEME_DIR}`
cd ${INSTALLED_THEME_DIR}

git clone ${GIT_REPO} .
cd $WD
