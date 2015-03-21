#!/bin/bash
# prints emacs mode home directory
SCRIPT_DIR=$(cd `dirname $0` && pwd)
EMACS_HOME=`${SCRIPT_DIR}/emacs-home.sh`
EMACS_MODE_HOME="$EMACS_HOME/mode"
echo "${EMACS_MODE_HOME}"
