#!/bin/sh -e
# USAGE: make symlink to this file in some directory that is contained PATH

SCRIPT_ROOT="$(dirname "$(realpath "$0")")"
if [ $# = 1 ] && [ "$1" = 'init' ]; then
    "$SCRIPT_ROOT"/devc-init.sh
elif [ $# = 1 ] && [ "$1" = 'update' ]; then
    "$SCRIPT_ROOT"/devc-update.sh
elif type python >/dev/null 2>&1; then
    python "$SCRIPT_ROOT"/python/devc.py "$@"
elif type python3; then
    python3 "$SCRIPT_ROOT"/python/devc.py "$@"
else
    INIT_WORKSPACE_COLOR=32
    UPDATE_SOURCE_COLOR=33
    INSTALL_PYTHON_COLOR=31
    COMMAND_COLOR=30
    echo "\e[${INSTALL_PYTHON_COLOR}m[cannot find python]\e[m so we can only do \e[${INIT_WORKSPACE_COLOR}m'init'\e[m or \e[${UPDATE_SOURCE_COLOR}m'update'\e[m." 1>&2
    echo "want to \e[${INIT_WORKSPACE_COLOR}m[initialize workspace]\e[m, by copy some files, try:"
    echo "$ \e[${COMMAND_COLOR}m$0\e[m \e[${INIT_WORKSPACE_COLOR}minit\e[m"
    echo "or want to \e[${UPDATE_SOURCE_COLOR}m[update copy source]\e[m, try:"
    echo "$ \e[${COMMAND_COLOR}m$0\e[m \e[${UPDATE_SOURCE_COLOR}mupdate\e[m"
    echo "any other else, \e[${INSTALL_PYTHON_COLOR}m<install python>\e[m and \e[${INSTALL_PYTHON_COLOR}m<try again>\e[m"
    exit 1
fi
