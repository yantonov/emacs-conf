#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/fommil/darcula-theme-emacs.git
MODE_DIR="darcula"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
