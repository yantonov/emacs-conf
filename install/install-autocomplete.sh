#/bin/bash

# http://cx4a.org/repo/auto-complete.git

SCRIPT_DIR=`dirname $0`
URL=http://cx4a.org/repo/auto-complete.git
MODE_DIR="auto-complete"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
