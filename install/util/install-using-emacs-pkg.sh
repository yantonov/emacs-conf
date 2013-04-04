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

emacs --batch -load ${SCRIPT_DIR}/elisp/init-package-system.el -load ${INSTALL_EMACS_LISP_SCRIPT}
