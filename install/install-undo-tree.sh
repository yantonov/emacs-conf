#!/bin/bash

# http://www.dr-qubit.org/git/undo-tree.git

SCRIPT_DIR=`dirname $0`
URL=http://www.dr-qubit.org/git/undo-tree.git
MODE_DIR="undo-tree"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

