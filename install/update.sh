#!/bin/sh

SCRIPT_DIR=$(cd `dirname $0` && pwd)

$SCRIPT_DIR/util/git-pull-all.sh
$SCRIPT_DIR/util/update-installed-emacs-packages.sh
