#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/massemanet/distel.git
MODE_DIR="distel"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
