#! /bin/bash
set -e
#########################ctrl+C#########################
unset tmp_dir
atexit() {
    [[ -n ${tmp_dir-} ]] && rm -rf "$tmp_dir"
    echo "cleaned tmp dir $tmp_dir"
}
trap atexit EXIT
trap 'rc=$?; trap - EXIT; atexit; exit $?' INT PIPE TERM
########################################################

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

timestamp=$(date +%Y%m%d%H%M%S)
tmp_dir=$(mktemp -dt "dotfiles.$timestamp.XXXXXX")

repository="https://github.com/hayas1/dotfiles.git"
git clone $repository "$tmp_dir"

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

remove_from "$(tr '\n' ' ' <"$tmp_dir/scripts/copylist.txt")" "$target"
