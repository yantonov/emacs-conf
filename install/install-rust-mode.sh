#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)
URL=https://github.com/rust-lang/rust-mode.git
MODE_DIR="rust-mode"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
