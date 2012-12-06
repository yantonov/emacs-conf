#/bin/bash

CURRENT_DIR=`dirname $0`
UTIL_DIR="${CURRENT_DIR}/shell-util"
WD=`pwd`
cd $UTIL_DIR
UTIL_DIR=`pwd`
cd $WD
EMACS_HOME=`${UTIL_DIR}/emacs-home.sh`
EMACS_MODE_HOME=`${UTIL_DIR}/emacs-mode-home.sh`

COLOR_THEMES_DIR=${EMACS_HOME}/color-themes
cd $COLOR_THEMES_DIR

SOLARIZED_THEME_DIR="solarized"
rm -rf ${SOLARIZED_THEME_DIR}
git clone https://github.com/sellout/emacs-color-theme-solarized.git ${SOLARIZED_THEME_DIR}