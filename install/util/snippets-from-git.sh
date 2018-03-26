#!/bin/bash

# script yasnippets from given git repo and minor mode

# Usage:
# first argument - git repo url
# second argument - dir name for minor mode

if [ $# -lt 2 ]; then
    echo "Usage: scriptname git_repo minor-mode"
    exit 0
else
    GIT_REPO=$1
    MODE=$2
fi

# init env
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EMACS_HOME=`${SCRIPT_DIR}/emacs-home.sh`
YASNIPPETS_HOME="${EMACS_HOME}/etc/snippets"

# run

cd ${YASNIPPETS_HOME}
rm -rf ${MODE}
mkdir -p ${MODE}
cd ${MODE}

git clone ${GIT_REPO} .
