#!/bin/bash

# simple script to shutdown the running Emacs daemon

# emacsclient options for reference
# -a Alternate editor, runs bin/false in this case
# -e eval the script

# If the server-process is bound and the server is in a good state, then kill
# the server

server_ok() {
    emacsclient -a "false" -e "(boundp 'server-process)"
}

server_stop() {
    # wasn't removing emacs from ALT-TAB on mac
    # emacsclient -e "(server-force-delete)"
    emacsclient -e '(kill-emacs)'
}

server_start() {
    emacs --daemon
}

if [ "t" == "$(server_ok)" ]; then
    echo "Shutting down Emacs server"
    server_stop
else
    echo "Emacs server not running"
    server_start
fi
