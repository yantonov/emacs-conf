#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL="https://github.com/emacs-helm/helm.git"
MODE_DIR="helm"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
