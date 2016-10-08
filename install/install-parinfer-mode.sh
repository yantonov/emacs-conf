#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/DogLooksGood/parinfer-mode.git
MODE_DIR="parinfer-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

