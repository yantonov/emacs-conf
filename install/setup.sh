#/bin/bash

OK="ok"
DELIMITER="--------"

WD=`pwd`
SCRIPT_DIR=`dirname $0`
SCRIPT_NAME=`basename $0`

for script in `ls install-* | grep "[^~]$"`
do
    if [ ${SCRIPT_NAME} != ${script} ]; then
	echo "Running '${SCRIPT_DIR}/${script}'"
	${SCRIPT_DIR}/${script}
	echo ${OK}
    else
	echo "Disable recursive calls of current script"
    fi
    echo ${DELIMITER}
done

cd ${WD}
