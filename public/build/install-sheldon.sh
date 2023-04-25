#! /bin/bash -e

# https://sheldon.cli.rs/Installation.html#pre-built-binaries
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh |
    bash -s -- --repo rossmacarthur/sheldon --to /usr/local/bin

cat <<'EOF' >>"${HOME}/.zshrc"
### load sheldon
eval "$(sheldon source)"

EOF
