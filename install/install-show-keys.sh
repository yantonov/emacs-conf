#!/bin/bash

# https://github.com/candera/show-keys.el.git

SCRIPT_DIR=`dirname $0`
URL=https://github.com/candera/show-keys.el.git
MODE_DIR="show-keys"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
