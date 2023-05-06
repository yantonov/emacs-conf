#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
URL="https://github.com/yantonov/yasnippet-sh-mode.git"
MODE_DIR="sh-mode"
$SCRIPT_DIR/util/snippets-from-git.sh ${URL} ${MODE_DIR}
