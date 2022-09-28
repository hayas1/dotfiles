#!/bin/bash -e
# USAGE: make symlink to this file in some directory that is contained PATH

usage() {
    # TODO
    echo "usage"
}

SCRIPT_ROOT="$(dirname "$(realpath "$0")")"
if [ "$1" = 'init' ]; then
    "$SCRIPT_ROOT"/devc-init.sh "$@"
elif [ "$1" = 'update' ]; then
    "$SCRIPT_ROOT"/devc-update.sh "$@"
elif [ "$1" = 'clean' ]; then
    "$SCRIPT_ROOT"/devc-clean.sh "$@"
else
    usage
fi
