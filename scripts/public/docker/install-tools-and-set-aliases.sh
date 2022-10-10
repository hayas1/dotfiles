#! /bin/bash
set -e

curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/.devcontainer/import/build/tools.sh' | bash -s

curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/.devcontainer/resources/.bash_aliases' >>"${HOME}/.bash_aliases"
echo '[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases' >>"${HOME}/.zshrc"
