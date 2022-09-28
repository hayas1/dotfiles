#!/bin/sh -e
echo '\e[36m###\e[m this is simple copy program \e[36m###\e[m'

copy_to_current() {
    if [ ! -e "$PWD/$1" ]; then
        cp -r "$REPO_ROOT"/"$1" "$PWD"/"$1"
        echo "\e[32m>>>\e[m made new directory $1"
    else
        echo "\e[31m!!!\e[m $1 already exists, so not copied" 1>&2
    fi
}

REPO_ROOT=$(dirname "$(dirname "$(realpath "$0")")")
copy_to_current .vscode
copy_to_current .devcontainer
