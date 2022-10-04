#! /bin/sh

DIR=$(dirname "$(realpath "$0")")
"$DIR"/installed-zsh.sh && "$DIR"/installed-tools.sh && "$DIR"/installed-hello.sh
