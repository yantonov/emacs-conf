#/bin/bash

# remove all emacs lisp compiled files

SCRIPT_DIR=`dirname $0`
EMACS_HOME=`${SCRIPT_DIR}/util/emacs-home.sh`
find ${EMACS_HOME} -name "*.elc" -print0 | xargs -0 rm
