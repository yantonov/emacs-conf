#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/juba/color-theme-tangotango.git
MODE_DIR="tango-color-theme"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
