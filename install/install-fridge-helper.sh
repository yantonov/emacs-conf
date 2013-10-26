#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/nschum/fringe-helper.el.git
MODE_DIR="fridge-helper"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
