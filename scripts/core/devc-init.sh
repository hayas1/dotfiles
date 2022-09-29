#!/bin/bash -e
CORE_DIR="$(dirname "$(realpath "$0")")"
source "$CORE_DIR/core.sh"

if [ $# = 0 ]; then
    target=$PWD
elif [ $# = 1 ] && [ -e "$1" ]; then
    target=$1
elif [ $# = 1 ] && [ ! -e "$1" ]; then
    echo "cannot find directory: $1" 1>&2
    exit 1
else
    echo "unexpected arguments: $*" 1>&2
    exit 1
fi

copy_to "$(tr '\n' ' ' <"$CORE_DIR"/copylist.txt)" "$target"
