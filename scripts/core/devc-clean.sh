#!/bin/bash -e
echo '### this is simple remove program ###'
remove_from() {
    local file_bases=${*:1:($# - 1)}
    echo -n ">>> really remove [$file_bases]? [y/N]"
    read -r ans
    case $ans in
    [Yy]*)
        local target=${*:$#}
        for f in $file_bases; do
            mv "$target"/"$f" "$tmp_dir"
        done
        echo "... files [$file_bases] moved to $tmp_dir"
        echo "^^^ want to recover, try \$ mv $tmp_dir/.[^\.]* $target"
        ;;
    *)
        echo "!!! do not remove [$file_bases]"
        ;;
    esac
}

timestamp=$(date +%Y%m%d%H%M%S)
tmp_dir=$(mktemp -dt "dotfiles.remove.$timestamp.XXXXXX")

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

remove_from .vscode .devcontainer "$target"
