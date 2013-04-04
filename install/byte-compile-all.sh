#!/bin/bash

SCRIPT_DIR=`dirname $0`
echo ${SCRIPT_DIR}
emacs -batch -l ${SCRIPT_DIR}/util/elisp/byte-compile-all.el
