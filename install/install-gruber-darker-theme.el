#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/rexim/gruber-darker-theme.git
MODE_DIR="gruber-darker"
$SCRIPT_DIR/util/color-theme-from-git.sh ${URL} ${MODE_DIR}
