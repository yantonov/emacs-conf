#!/bin/bash

# page
# http://www.emacswiki.org/emacs/HighlightParentheses
# direct url
# http://nschum.de/src/emacs/highlight-parentheses/highlight-parentheses.el

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

INSTALLED_MODE_EL_FILE_URL="http://mumble.net/~campbell/emacs/paredit.el"
INSTALLED_MODE_DIR="paredit"

cd ${EMACS_MODE_HOME}
`${UTIL_DIR}/mkdir.sh ${INSTALLED_MODE_DIR}`
cd ${INSTALLED_MODE_DIR}

wget ${INSTALLED_MODE_EL_FILE_URL}




