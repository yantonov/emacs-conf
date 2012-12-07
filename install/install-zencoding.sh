#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/rooney/zencoding.git"
MODE_DIR="zencoding-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

