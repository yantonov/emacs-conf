#!/bin/sh

SCRIPT_DIR=$(cd `dirname $0` && pwd)
INIT_EL_PATH=$(cd $SCRIPT_DIR/../../../ && echo `pwd`/init.el)

emacs -Q -l $SCRIPT_DIR/profile-dotemacs.el --eval "(setq profile-dotemacs-file  (setq load-file-name \"$INIT_EL_PATH\"))" -f profile-dotemacs
