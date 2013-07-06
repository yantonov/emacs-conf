#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/kuanyui/moe-theme.el.git
MODE_DIR="moe-theme"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
