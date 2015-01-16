#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/d11wtq/grizzl.git"
MODE_DIR="grizzl"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

