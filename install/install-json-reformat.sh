#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/gongo/json-reformat.git
MODE_DIR="json-reformat"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
