#!/bin/bash

# https://github.com/auto-complete/auto-complete

SCRIPT_DIR=`dirname $0`
URL=https://github.com/auto-complete/auto-complete
MODE_DIR="auto-complete"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
