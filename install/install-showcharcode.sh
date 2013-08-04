#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/yantonov/showcharcode.git
MODE_DIR="showcharcode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

