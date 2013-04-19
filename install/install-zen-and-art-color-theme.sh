#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/irfn/zen-and-art.git
MODE_DIR="zen-and-art"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
