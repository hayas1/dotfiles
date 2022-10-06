#! /bin/bash -e

VERSION=${RUST_VERSION:-"latest"}
VERSION=${1:-$VERSION}

# https://forge.rust-lang.org/infra/other-installation-methods.html#other-ways-to-install-rustup
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"

if [ "$VERSION" != "latest" ]; then
    rustup default "$VERSION"
fi

mkdir -p "$HOME/.cargo"
chown "${USER:-vscode}" "$HOME/.cargo"
