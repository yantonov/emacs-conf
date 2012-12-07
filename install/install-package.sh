#/bin/bash

SCRIPT_DIR=`dirname $0`
URL="http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el"
MODE_DIR="package"
$SCRIPT_DIR/util/single-file-mode.sh ${URL} ${MODE_DIR}

