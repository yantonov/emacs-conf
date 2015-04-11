#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)
EMACS_HOME=`${SCRIPT_DIR}/emacs-home.sh`
EMACS_COLOR_THEME_HOME="$EMACS_HOME/color-themes"
echo "${EMACS_COLOR_THEME_HOME}"
