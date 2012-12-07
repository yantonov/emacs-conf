#!/bin/bash

# page
# http://www.emacswiki.org/emacs/HighlightParentheses
# direct url
# http://nschum.de/src/emacs/highlight-parentheses/highlight-parentheses.el

SCRIPT_DIR=`dirname $0`
URL="http://nschum.de/src/emacs/highlight-parentheses/highlight-parentheses.el"
MODE_DIR="highlight-parentheses"
$SCRIPT_DIR/util/single-file-mode.sh ${URL} ${MODE_DIR}
