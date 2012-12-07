#/bin/bash

CURRENT_DIR=`dirname $0`
URL="https://github.com/sellout/emacs-color-theme-solarized.git"
COLOR_THEME_DIR="solarized"
${CURRENT_DIR}/util/color-theme-from-git.sh ${URL} ${COLOR_THEME_DIR}
