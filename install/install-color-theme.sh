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
cd $WD
EMACS_HOME=`${UTIL_DIR}/emacs-home.sh`
EMACS_MODE_HOME=`${UTIL_DIR}/emacs-mode-home.sh`

# run

INSTALLED_MODE_EL_FILE_URL="http://download-mirror.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.zip"
INSTALLED_MODE_DIR="color-themes"

cd ${EMACS_MODE_HOME}
wget ${INSTALLED_MODE_EL_FILE_URL}
ARCHIVE_FILE=`basename ${INSTALLED_MODE_EL_FILE_URL}`
unzip -d . ${ARCHIVE_FILE}
rm ${ARCHIVE_FILE}
NUMBER_OF_DIRS=`ls -ld color-theme* | wc -l`
if [ ${NUMBER_OF_DIRS} -eq 1 ]; then
    mv color-theme* color-theme
fi
