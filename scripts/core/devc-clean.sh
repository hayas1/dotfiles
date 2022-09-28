#!/bin/bash -e
echo '### this is simple remove program ###'
remove_from() {
    echo -n ">>> really remove ${*:1:($# - 1)}? [y/N]"
    read -r ans
    case $ans in
    [Yy]*)
        for f in "${@:1:($# - 1)}"; do
            mv "${*:$#}"/"$f" "$tmp_dir"
        done
        echo "... files ${*:1:($# - 1)} moved to $tmp_dir"
        echo "^^^ want to recover, try \$ mv $tmp_dir/.[^\.]* ${*:$#}"
        ;;
    *)
        echo "!!! do not remove ${*:1:($# - 1)}"
        ;;
    esac
}

timestamp=$(date +%Y%m%d%H%M%S)
tmp_dir=$(mktemp -dt "dotfiles.remove.$timestamp.XXXXXX")

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

remove_from .vscode .devcontainer "$TARGET"
