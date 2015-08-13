#!/bin/bash

SCRIPT_DIR=$(cd `dirname $0` && pwd)

${SCRIPT_DIR}/util/install-using-emacs-pkg.sh go-mode
${SCRIPT_DIR}/util/install-using-emacs-pkg.sh go-eldoc

# find typical code problem
# go get golang.org/x/tools/cmd/vet

# go to definition
# go get -v github.com/rogpeppe/godef

# find usages
# go get golang.org/x/tools/cmd/oracle

