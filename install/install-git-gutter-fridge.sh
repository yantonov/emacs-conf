#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/syohex/emacs-git-gutter-fringe.git
MODE_DIR="git-gutter-fridge"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

