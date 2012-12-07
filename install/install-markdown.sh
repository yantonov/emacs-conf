#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="http://jblevins.org/git/markdown-mode.git"
MODE_DIR="markdown-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

