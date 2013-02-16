#/bin/bash

SCRIPT_DIR=`dirname $0`
emacs --batch $SCRIPT_DIR/util/elisp/byte-compile-all.el
