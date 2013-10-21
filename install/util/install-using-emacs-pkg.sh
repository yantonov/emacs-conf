#!/bin/bash

# install mode using emacs package system

# usage:
# first argument emacs_lisp_installation_file

if [ $# -lt 1 ]; then
    echo "Usage: scriptname emacs_lisp_installation_file"
    exit 0
else
    INSTALL_EMACS_LISP_SCRIPT=$1
fi

SCRIPT_DIR=`dirname $0`
os=`uname`
if [[ ${os} == *_NT* ]]; then    
    emacs -q -l ${SCRIPT_DIR}/elisp/init-package-system.el -l ${INSTALL_EMACS_LISP_SCRIPT} -l ${SCRIPT_DIR}/elisp/close-emacs.el
else    
    emacs -q -batch -l ${SCRIPT_DIR}/elisp/init-package-system.el -l ${INSTALL_EMACS_LISP_SCRIPT}
fi
