#!/bin/bash

# http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.zip
# alternative url
# http://download-mirror.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.zip

# init env

CURRENT_DIR=`dirname $0`
UTIL_DIR="${CURRENT_DIR}/util"
WD=`pwd`
cd $UTIL_DIR
UTIL_DIR=`pwd`
EMACS_HOME=`${UTIL_DIR}/emacs-home.sh`
EMACS_MODE_HOME=`${UTIL_DIR}/emacs-mode-home.sh`

# run

INSTALLED_MODE_EL_FILE_URL="http://download-mirror.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.zip"
INSTALLED_MODE_DIR="color-theme"

cd ${EMACS_MODE_HOME}
wget ${INSTALLED_MODE_EL_FILE_URL}
ARCHIVE_FILE=`basename ${INSTALLED_MODE_EL_FILE_URL}`
unzip -d . ${ARCHIVE_FILE}
if [ -f ${ARCHIVE_FILE} ]; then
    rm ${ARCHIVE_FILE}
fi
if [ -d ${INSTALLED_MODE_DIR} ]; then
    rm -rf ${INSTALLED_MODE_DIR}
fi
NUMBER_OF_DIRS=`ls -la | grep "color-theme-.*" | wc -l`
if [ ${NUMBER_OF_DIRS} -eq 1 ]; then
    UNPACKED_DIR=`ls -la | grep "color-theme-.*" | awk -F\  '{print $9}'`
    if [ -d ${UNPACKED_DIR} ]; then
	mv ${UNPACKED_DIR} ${INSTALLED_MODE_DIR}
    fi
fi

cd ${WD}
