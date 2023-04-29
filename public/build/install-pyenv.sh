#! /bin/bash -e

### https://github.com/pyenv/pyenv#basic-github-checkout
git clone https://github.com/pyenv/pyenv.git "${HOME}/.pyenv"
pushd "${HOME}/.pyenv" && src/configure && make -C src && popd

cat <<'EOF' >>"$HOME/.zshrc"
### pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

EOF
