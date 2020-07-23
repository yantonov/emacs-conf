#!/usr/bin/env sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

HOME_BIN="${HOME}/bin"
mkdir -p "${HOME_BIN}"
cd "${HOME_BIN}"

link() {
    SCRIPT_NAME="$1"
    LINK_NAME="$2"
    if [ -f "${LINK_NAME}" ]; then
        rm "${LINK_NAME}"
    fi
    ln -s "${SCRIPT_DIR}/${SCRIPT_NAME}" "${LINK_NAME}"
}

link "ec.sh" "ec"
link "et.sh" "et"
link "es.sh" "es"
