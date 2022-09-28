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

timestamp=$(date +%Y%m%d%H%M%S)
tmp_dir=$(mktemp -dt "dotfiles.$timestamp.XXXXXX")

repository="https://github.com/hayas1/dotfiles.git"
git clone $repository "$tmp_dir"

init_script="$tmp_dir/scripts/devc-clean.sh"
$init_script
