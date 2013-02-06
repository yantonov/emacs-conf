#!/bin/bash
# prints emacs mode home directory
CURRENT_DIR=`dirname $0`
EMACS_HOME=`${CURRENT_DIR}/emacs-home.sh`
EMACS_COLOR_THEME_HOME="$EMACS_HOME/color-themes"
echo "${EMACS_COLOR_THEME_HOME}"
