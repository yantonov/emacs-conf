#/bin/bash

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

PACKAGE_EL_URL="http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el"
PACKAGE_MODE_DIR="package"

cd ${EMACS_MODE_HOME}
`${UTIL_DIR}/mkdir.sh ${PACKAGE_MODE_DIR}`
cd ${PACKAGE_MODE_DIR}

wget ${PACKAGE_EL_URL}


