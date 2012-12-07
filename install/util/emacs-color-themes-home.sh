#!/bin/bash
# prints emacs color themes home directory
CURRENT_DIR=`dirname $0`
EMACS_HOME=`${CURRENT_DIR}/emacs-home.sh`
EMACS_MODE_HOME="$EMACS_HOME/color-themes"
echo "${EMACS_MODE_HOME}"