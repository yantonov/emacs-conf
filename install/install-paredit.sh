#!/bin/bash

CURRENT_DIR=`dirname $0`
URL="http://mumble.net/~campbell/emacs/paredit.el"
MODE_DIR="paredit"
${CURRENT_DIR}/util/util-install-single-file.sh ${URL} ${MODE_DIR}
