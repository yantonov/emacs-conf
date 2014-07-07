#!/bin/bash

SCRIPT_DIR=`dirname $0`
URL=https://github.com/pashky/restclient.el.git
MODE_DIR="restclient"
$SCRIPT_DIR/util/mode-from-git.sh ${URL} ${MODE_DIR}
