#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/bbatsov/zenburn-emacs.git
MODE_DIR="zenburn"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
