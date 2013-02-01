#!/bin/bash

# https://github.com/bbatsov/projectile.git

SCRIPT_DIR=`dirname $0`
URL=https://github.com/bbatsov/projectile.git
MODE_DIR="projectile"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}

