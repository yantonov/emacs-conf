#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)

emacs -batch \
    -l ${SCRIPT_DIR}/../../etc/etc-package.el \
    -l ${SCRIPT_DIR}/elisp/refresh-package-info.el \
    -l ${SCRIPT_DIR}/elisp/update-installed.el \
    -update-packages

