#! /bin/bash -e

GOVERSION=${GO_VERSION:-"latest"}
GOVERSION=${1:-$GOVERSION}
WORK_DIR=$(mktemp -dt "dotfiles-install-go-$(date +%Y%m%d%H%M%S)-XXXXXX")

if [ "$GOVERSION" = "latest" ]; then
    VERSION=$(curl -fsL https://go.dev/VERSION?m=text)
elif [[ "$GOVERSION" =~ ^go.*$ ]]; then
    VERSION="$GOVERSION"
else
    VERSION="go$GOVERSION"
fi

# https://go.dev/doc/install
INSTALL_PATH="/usr/lib/"
wget -P "$WORK_DIR/" "https://go.dev/dl/$VERSION.linux-amd64.tar.gz"
tar -xzf "$WORK_DIR/$VERSION.linux-amd64.tar.gz" -C "$INSTALL_PATH"
# ln -s "$INSTALL_PATH"/go/bin/* /usr/bin/
ln -s "$INSTALL_PATH"/go/bin/go /usr/bin/go
ln -s "$INSTALL_PATH"/go/bin/gofmt /usr/bin/gofmt

# go bin path
cat <<'EOF' >>"$HOME/.zshrc"
### go bin settings
export PATH=$PATH:$HOME/go/bin

EOF
