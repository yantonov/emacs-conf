#!/bin/bash

script_dir=$(cd `dirname $0` && pwd)
URL="https://github.com/purcell/elisp-slime-nav.git"
MODE_DIR="elisp-slime-nav"
$script_dir/util/mode-from-git.sh ${URL} ${MODE_DIR}

