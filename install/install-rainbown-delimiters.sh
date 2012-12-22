#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/jlr/rainbow-delimiters.git"
MODE_DIR="rainbow-delimiters"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

