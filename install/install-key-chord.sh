#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="http://www.emacswiki.org/emacs/download/key-chord.el"
MODE_DIR="key-chord"
$SCRIPT_DIR/util/single-file-mode.sh ${URL} ${MODE_DIR}

