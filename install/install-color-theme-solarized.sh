#!/bin/bash

# https://github.com/sellout/emacs-color-theme-solarized.git

SCRIPT_DIR=`dirname $0`
URL=https://github.com/sellout/emacs-color-theme-solarized.git
MODE_DIR="solarized"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}

