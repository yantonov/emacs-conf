#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/emacs-ess/ESS
MODE_DIR="ess"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

