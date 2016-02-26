#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/dacap/keyfreq.git"
MODE_DIR="keyfreq-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

