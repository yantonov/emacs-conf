#!/bin/bash

OK="ok"
DELIMITER="--------"

SCRIPT_DIR=$(cd `dirname $0` && pwd)
EMACS_MODE_HOME=`${SCRIPT_DIR}/emacs-mode-home.sh`

cd $EMACS_MODE_HOME
for modedir in `ls -la | awk -F\  '{print $9}'`
do
    if [ -d ${modedir} -a ${modedir} != "." -a ${modedir} != ".." ]; then
    echo "Pulling updates for '${modedir}'"
    cd ${modedir}
    if [ -d ".git" ]; then
        git pull
    fi
    echo $OK
    echo $DELIMITER
    cd ..
    fi
done
