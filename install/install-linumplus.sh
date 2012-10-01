#!/bin/bash

# linum
# http://www.emacswiki.org/emacs/LinumPlus
# trunk
# http://code.google.com/p/dea/source/browse/trunk/my-lisps/linum%2B.el
# raw file
# http://dea.googlecode.com/svn/trunk/my-lisps/linum+.el

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

INSTALLED_MODE_EL_FILE_URL="http://dea.googlecode.com/svn/trunk/my-lisps/linum+.el"
INSTALLED_MODE_DIR="linumplus"

cd ${EMACS_MODE_HOME}
`${UTIL_DIR}/mkdir.sh ${INSTALLED_MODE_DIR}`
cd ${INSTALLED_MODE_DIR}

wget ${INSTALLED_MODE_EL_FILE_URL}


