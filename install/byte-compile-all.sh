#/bin/bash

SCRIPT_DIR=`dirname $0`
emacs -load $SCRIPT_DIR/util/byte-compile-all.el -kill
