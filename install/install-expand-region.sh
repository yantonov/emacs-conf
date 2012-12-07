#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/magnars/expand-region.el.git"
MODE_DIR="expand-region"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
