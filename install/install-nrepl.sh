#!/bin/bash

# https://github.com/kingtim/nrepl.el

SCRIPT_DIR=`dirname $0`
URL=https://github.com/kingtim/nrepl.el.git
MODE_DIR="nrepl"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

