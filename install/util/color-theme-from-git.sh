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
SCRIPT_DIR=$(cd `dirname $0` && pwd)
EMACS_COLOR_THEME_HOME=`${SCRIPT_DIT}/emacs-color-theme-home.sh`

# run

cd ${EMACS_COLOR_THEME_HOME}
rm -rf ${INSTALLED_THEME_DIR}
mkdir -p ${INSTALLED_THEME_DIR}
cd ${INSTALLED_THEME_DIR}

git clone ${GIT_REPO} .
