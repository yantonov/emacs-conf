#!/bin/bash

# install mode using emacs package system

# usage:
# first argument emacs_lisp_installation_file

if [ $# -lt 1 ]; then
    echo "Usage: scriptname package-name"
    exit 0
else
    EMACS_PACKAGE_NAME=$1
fi

if [ -n "${EMACS_PACKAGE_NAME}" ]; then
    SCRIPT_DIR=`dirname $0`
    os=`uname`
    if [[ ${os} == *_NT* ]]; then
        emacs -q -l ${SCRIPT_DIR}/../../etc/etc-package.el \
            -l ${SCRIPT_DIR}/elisp/refresh-package-info.el \
            -l ${SCRIPT_DIR}/elisp/install-package.el \
            -install-package ${EMACS_PACKAGE_NAME} \
            -l ${SCRIPT_DIR}/elisp/close-emacs.el
    else    
        emacs -q -batch -l ${SCRIPT_DIR}/../../etc/etc-package.el \
            -l ${SCRIPT_DIR}/elisp/install-package.el \
            -l ${SCRIPT_DIR}/elisp/refresh-package-info.el \
            -install-package ${EMACS_PACKAGE_NAME}
    fi
else
    echo "package name is not defined"
fi


