#!/bin/bash

# https://github.com/technomancy/find-file-in-project.git

SCRIPT_DIR=`dirname $0`
URL=https://github.com/technomancy/find-file-in-project.git
MODE_DIR="find-file-in-project"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

