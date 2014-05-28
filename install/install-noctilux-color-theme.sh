#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/stafu/noctilux-theme.git
MODE_DIR="noctilux"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
