#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)

${SCRIPT_DIR}/util/install-using-emacs-pkg.sh go-mode
${SCRIPT_DIR}/util/install-using-emacs-pkg.sh go-eldoc

# go get golang.org/x/tools/cmd/vet
# go get -v github.com/rogpeppe/godef


