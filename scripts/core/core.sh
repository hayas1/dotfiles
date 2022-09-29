#!/bin/bash -e
REPO_ROOT=$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")

copy_to() {
    echo '### this is simple copy program ###'
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

remove_from() {
    echo '### this is simple remove program ###'
    local tmp_dir=$(mktemp -dt "dotfiles.remove.$(date +%Y%m%d%H%M%S).XXXXXX")
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
