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

copy_to() {
    echo '### this is simple copy program ###'
    local dir_bases="${*:1:($# - 1)}"
    local target=${*:$#}
    for d in $dir_bases; do
        if [ ! -e "$target/$d" ]; then
            cp -r "$tmp_dir"/"$d" "$target"/"$d"
            echo ">>> made new directory $d"
        else
            echo "!!! $d already exists, so not copied" 1>&2
        fi
    done
}

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

timestamp=$(date +%Y%m%d%H%M%S)
tmp_dir=$(mktemp -dt "dotfiles.$timestamp.XXXXXX")

repository="https://github.com/hayas1/dotfiles.git"
git clone $repository "$tmp_dir"

copy_to "$(tr '\n' ' ' <"$tmp_dir/scripts/copylist.txt")" "$target"
