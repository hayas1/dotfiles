#!/bin/sh -e
echo '\e[36m###\e[m this is simple remove program \e[36m###\e[m'

remove_current() {
    if [ ! -e "$PWD/$1" ]; then
        echo "\e[32m!!!\e[m no file $1" 1>&2
    else
        echo -n "\e[31m>>>\e[m really remove $1? [y/N]"
        read ans
        case $ans in
        [Yy]*)
            mv "$PWD"/"$1" "$tmp_dir"
            echo "\e[31m...\e[m file $1 moved to $tmp_dir"
            echo "\e[30m^^^ want to recover, try \$ mv $tmp_dir/.* $PWD\e[m"
            ;;
        *)
            echo "\e[32m!!!\e[m do not remove $1"
            ;;
        esac
    fi
}

timestamp=$(date +%Y%m%d%H%M%S)
tmp_dir=$(mktemp -dt "dotfiles.remove.$timestamp.XXXXXX")

remove_current .vscode
remove_current .devcontainer
