#!/bin/bash

# page
# https://github.com/kingtim/nrepl.el
# raw file
# https://raw.github.com/kingtim/nrepl.el/master/nrepl.el

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

INSTALLED_MODE_EL_FILE_URL="https://raw.github.com/kingtim/nrepl.el/master/nrepl.el"
INSTALLED_MODE_DIR="nrepl"

cd ${EMACS_MODE_HOME}
`${UTIL_DIR}/mkdir.sh ${INSTALLED_MODE_DIR}`
cd ${INSTALLED_MODE_DIR}

wget ${INSTALLED_MODE_EL_FILE_URL}




