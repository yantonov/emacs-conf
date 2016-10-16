#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/dysinger/purescript-mode.git
MODE_DIR="purescript-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
# post process
EMACS_MODE_HOME=`${SCRIPT_DIR}/util/emacs-mode-home.sh`
cd $EMACS_MODE_HOME/$MODE_DIR
make all
