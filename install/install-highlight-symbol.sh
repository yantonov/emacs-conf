#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/nschum/highlight-symbol.el
MODE_DIR="highlight-symbol"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

