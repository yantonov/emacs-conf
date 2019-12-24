#!/usr/bin/env bash
set -eu

SCRIPT="$(basename "$0")"

if [ "$#" -ne 2 ]; then
    echo "usage: ${SCRIPT} file1 file2"
    exit 0
fi

FILE1="$1"
FILE2="$2"

emacs --eval "(diff \"${FILE1}\" \"${FILE2}\")"
