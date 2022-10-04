#! /bin/bash -e

VERSION=${GO_VERSION:-"latest"}
VERSION=${1:-$VERSION}

if [ "$VERSION" = "latest" ]; then
    GOVERSION=$(curl -fsL https://go.dev/VERSION?m=text)
elif [[ "$VERSION" =~ ^go.*$ ]]; then
    GOVERSION="$VERSION"
else
    GOVERSION="go$VERSION"
fi

# https://go.dev/doc/install
WORK_DIR="${DEVC_CONFIG:-$HOME/.devc}/work/go"
INSTALL_PATH="/usr/lib/"
wget -P "$WORK_DIR/" "https://go.dev/dl/$GOVERSION.linux-amd64.tar.gz"
tar -xzf "$WORK_DIR/$GOVERSION.linux-amd64.tar.gz" -C "$INSTALL_PATH"
# ln -s "$INSTALL_PATH"/go/bin/* /usr/bin/
ln -s "$INSTALL_PATH"/go/bin/go /usr/bin/go
ln -s "$INSTALL_PATH"/go/bin/gofmt /usr/bin/gofmt

# for develop
go install -v golang.org/x/tools/gopls@latest
