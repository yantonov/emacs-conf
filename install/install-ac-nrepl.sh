#!/bin/bash

# https://github.com/purcell/ac-nrepl

SCRIPT_DIR=`dirname $0`
URL=https://github.com/purcell/ac-nrepl.git
MODE_DIR="ac-nrepl"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}