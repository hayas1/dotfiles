#! /bin/bash -e

if ! (type zsh >/dev/null 2>&1); then
    apt-get update -y && apt-get install -y zsh
fi

if [ -e "$HOME/.zshrc" ]; then
    # install script overwrite .zshrc
    WORK_DIR=$(mktemp -dt "dotfiles-install-oh-my-zsh-$(date +%Y%m%d%H%M%S)-XXXXXX")
    cp "$HOME/.zshrc" "$WORK_DIR/.zshrc"
fi

sh -c "$(curl -fsL https://github.com/ohmyzsh/ohmyzsh/raw/master/tools/install.sh)"

if [ -n "$WORK_DIR" ]; then
    cp "$WORK_DIR/.zshrc" "$HOME/.zshrc"
fi
