#!/bin/bash -e
echo '### this is simple copy program ###'

copy_to() {
    if [ ! -e "$2/$1" ]; then
        cp -r "$REPO_ROOT"/"$1" "$2"/"$1"
        echo ">>> made new directory $1"
    else
        echo "!!! $1 already exists, so not copied" 1>&2
    fi
}

if [ $# = 0 ]; then
    TARGET=$PWD
elif [ $# = 1 ] && [ -e "$1" ]; then
    TARGET=$1
elif [ $# = 1 ] && [ ! -e "$1" ]; then
    echo "cannot find directory: $1" 1>&2
    exit 1
else
    echo "unexpected arguments: $*" 1>&2
    exit 1
fi

REPO_ROOT=$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")
copy_to .vscode "$TARGET"
copy_to .devcontainer "$TARGET"
