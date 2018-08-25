#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/ocaml/tuareg.git
MODE_DIR="tuareg-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
