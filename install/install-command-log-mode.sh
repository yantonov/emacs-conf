#!/bin/bash

# https://github.com/lewang/command-log-mode.git

SCRIPT_DIR=`dirname $0`
URL=https://github.com/lewang/command-log-mode.git
MODE_DIR="command-log-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
