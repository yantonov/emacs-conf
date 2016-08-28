#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=http://github.com/yoshiki/yaml-mode
MODE_DIR="yaml-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

