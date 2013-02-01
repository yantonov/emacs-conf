#!/bin/bash

# https://github.com/magnars/dash.el.git

SCRIPT_DIR=`dirname $0`
URL=https://github.com/magnars/dash.el.git
MODE_DIR="dash"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

