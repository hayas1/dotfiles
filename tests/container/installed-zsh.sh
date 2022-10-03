#! /bin/sh

zsh -c exit && cat /home/vscode/.oh-my-zsh/custom/themes/powerlevel10k/internal/p10k.zsh >/dev/null &&
    diff /workspaces/dotfiles/.devcontainer/resources/.p10k.zsh ~/.p10k.zsh 1>&2 &&
    diff /workspaces/dotfiles/.devcontainer/resources/.bash_aliases ~/.bash_aliases 1>&2
