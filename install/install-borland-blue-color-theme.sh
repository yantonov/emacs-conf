#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/fourier/borland-blue-theme.git
MODE_DIR="borland-blue"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
