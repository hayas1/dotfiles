#!/bin/bash -e

usage() {
    # TODO remove all tmp file
    echo "usage of clean"
}

SCRIPT_ROOT="$(dirname "$(realpath "$0")")"
"$SCRIPT_ROOT"/core/devc-clean.sh "${@:2}" || usage
