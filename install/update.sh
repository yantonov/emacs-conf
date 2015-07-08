#!/bin/sh

SCRIPT_DIR=$(cd `dirname $0` && pwd)

target=$1

case $target in
    git)
        $SCRIPT_DIR/util/git-pull-all.sh
        ;;
    emacs)
        $SCRIPT_DIR/util/update-installed-emacs-packages.sh
        ;;
    all)
        $SCRIPT_DIR/util/git-pull-all.sh
        $SCRIPT_DIR/util/update-installed-emacs-packages.sh
        ;;
    *)
        $SCRIPT_DIR/util/git-pull-all.sh
        $SCRIPT_DIR/util/update-installed-emacs-packages.sh
        ;;
esac




