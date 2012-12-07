#!/bin/bash

# linum
# http://www.emacswiki.org/emacs/LinumPlus
# trunk
# http://code.google.com/p/dea/source/browse/trunk/my-lisps/linum%2B.el
# raw file
# http://dea.googlecode.com/svn/trunk/my-lisps/linum+.el

SCRIPT_DIR=`dirname $0`
URL="http://dea.googlecode.com/svn/trunk/my-lisps/linum+.el"
MODE_DIR="linumplus"
$SCRIPT_DIR/util/single-file-mode.sh ${URL} ${MODE_DIR}

