#! /bin/sh

zsh -c exit && test -e "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k/internal/p10k.zsh" &&
    diff "${WORKSPACE}/.devcontainer/resources/.p10k.zsh" "${HOME}/.p10k.zsh" 1>&2 &&
    diff "${WORKSPACE}/.devcontainer/resources/.bash_aliases" "${HOME}/.bash_aliases" 1>&2
