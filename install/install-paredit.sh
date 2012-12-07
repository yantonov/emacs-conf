#!/bin/bash

CURRENT_DIR=`dirname $0`
URL="http://mumble.net/~campbell/emacs/paredit.el"
MODE_DIR="paredit"
${CURRENT_DIR}/util/single-file-mode.sh ${URL} ${MODE_DIR}
