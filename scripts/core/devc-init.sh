#!/bin/bash -e
echo '### this is simple copy program ###'

copy_to() {
    local dir_bases="${*:1:($# - 1)}"
    local target=${*:$#}
    for d in $dir_bases; do
        if [ ! -e "$target/$d" ]; then
            cp -r "$REPO_ROOT"/"$d" "$target"/"$d"
            echo ">>> made new directory $d"
        else
            echo "!!! $d already exists, so not copied" 1>&2
        fi
    done

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
copy_to .vscode .devcontainer "$TARGET"
