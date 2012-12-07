#!/bin/bash
# prints emacs mode home directory
CURRENT_DIR=`dirname $0`
EMACS_HOME=`${CURRENT_DIR}/emacs-home.sh`
EMACS_MODE_HOME="$EMACS_HOME/mode"
echo "${EMACS_MODE_HOME}"