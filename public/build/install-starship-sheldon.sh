#! /bin/bash -e

# https://starship.rs/#quick-install
curl -fsL https://starship.rs/install.sh | sh -s -- -y

# https://sheldon.cli.rs/Installation.html#pre-built-binaries
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh |
    bash -s -- --repo rossmacarthur/sheldon --to /usr/local/bin

# multi bytes
apt-get install -y locales
localedef -f UTF-8 -i en_US en_US.UTF-8

cat <<'EOF' >>"${HOME}/.zshrc"
### load sheldon
eval "$(sheldon source)"
### load starship
eval "$(starship init zsh)"

EOF
