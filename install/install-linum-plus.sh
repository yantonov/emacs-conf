#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/yantonov/linum-plus.git
MODE_DIR="linum-plus"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
