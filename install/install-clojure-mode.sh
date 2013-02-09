#/bin/bash

SCRIPT_DIR=`dirname $0`
emacs -q -load $SCRIPT_DIR/util/install-clojure-mode.el -kill
