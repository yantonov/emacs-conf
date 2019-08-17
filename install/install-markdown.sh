#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/jrblevin/markdown-mode.git"
MODE_DIR="markdown-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

