#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/oneKelvinSmith/monokai-emacs
MODE_DIR="monokai"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
 
