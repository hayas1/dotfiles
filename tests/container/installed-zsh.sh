#! /bin/sh
REPOSITORY="$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")"
zsh -c exit && test -e "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k/internal/p10k.zsh" &&
    # diff "${REPOSITORY}/public/resources/.zshrc" "${HOME}/.zshrc" 1>&2 &&
    diff "${REPOSITORY}/public/resources/.p10k.zsh" "${HOME}/.p10k.zsh" 1>&2 &&
    diff "${REPOSITORY}/public/resources/.bash_aliases" "${HOME}/.bash_aliases" 1>&2
