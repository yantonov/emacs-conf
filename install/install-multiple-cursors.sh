#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/magnars/multiple-cursors.el.git
MODE_DIR="multiple-cursors"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
