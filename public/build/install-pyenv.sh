#! /bin/bash -e

### https://github.com/pyenv/pyenv#basic-github-checkout
git clone https://github.com/pyenv/pyenv.git "${HOME}/.pyenv"
pushd "${HOME}/.pyenv" && src/configure && make -C src && popd

{
    echo 'export PYENV_ROOT="$HOME/.pyenv"'
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"'
    echo 'eval "$(pyenv init -)"'
} >>"${HOME}/.zshrc"
