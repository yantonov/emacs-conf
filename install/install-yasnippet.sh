#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/capitaomorte/yasnippet.git"
MODE_DIR="yasnippet"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

