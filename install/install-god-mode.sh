#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/chrisdone/god-mode.git"
MODE_DIR="god-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

