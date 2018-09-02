#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/dracula/emacs.git
MODE_DIR="dracula"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
