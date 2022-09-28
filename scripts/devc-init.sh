#!/bin/bash -e

usage() {
    # TODO
    echo "usage of init"
}

SCRIPT_ROOT="$(dirname "$(realpath "$0")")"
"$SCRIPT_ROOT"/core/devc-init.sh "${@:2}" || usage
