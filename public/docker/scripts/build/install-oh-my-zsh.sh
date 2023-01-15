#! /bin/bash -e

if ! (type zsh >/dev/null 2>&1); then
    apt-get update -y && apt-get install -y zsh
fi

sh -c "$(curl -fsL https://github.com/ohmyzsh/ohmyzsh/raw/master/tools/install.sh)"
