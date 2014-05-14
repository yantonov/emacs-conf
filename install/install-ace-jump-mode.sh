#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/winterTTr/ace-jump-mode.git
MODE_DIR="ace-jump-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

