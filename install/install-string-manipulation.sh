#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/magnars/s.el.git"
MODE_DIR="string-manipulation"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

