#!/bin/bash

# page
# http://jblevins.org/git/markdown-mode.git

# init env

CURRENT_DIR=`dirname $0`
UTIL_DIR="${CURRENT_DIR}/shell-util"
WD=`pwd`
cd $UTIL_DIR
UTIL_DIR=`pwd`
cd $WD
EMACS_HOME=`${UTIL_DIR}/emacs-home.sh`
EMACS_MODE_HOME=`${UTIL_DIR}/emacs-mode-home.sh`

# run

GIT_REPO="http://jblevins.org/git/markdown-mode.git"
INSTALLED_MODE_DIR="markdown-mode"

cd ${EMACS_MODE_HOME}
rm -rf ${INSTALLED_MODE_DIR}
`${UTIL_DIR}/mkdir.sh ${INSTALLED_MODE_DIR}`
cd ${INSTALLED_MODE_DIR}

git clone ${GIT_REPO} .
