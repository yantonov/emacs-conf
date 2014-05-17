#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/abo-abo/ace-window.git
MODE_DIR="ace-window"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

