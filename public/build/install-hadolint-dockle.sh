#! /bin/bash -e

### install hadolint https://github.com/hadolint/hadolint#install
WORK_DIR=$(mktemp -dt "dotfiles-install-go-$(date +%Y%m%d%H%M%S)-XXXXXX")
wget -P "$WORK_DIR" https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64
chmod +x "$WORK_DIR/hadolint-Linux-x86_64"
ln -s "$WORK_DIR/hadolint-Linux-x86_64" /usr/bin/hadolint

### install dockle https://github.com/goodwithtech/dockle#debianubuntu
DOCKLE_VERSION=$(
    curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" |
        grep '"tag_name":' |
        sed -E 's/.*"v([^"]+)".*/\1/'
)
curl -fsL -o "$WORK_DIR/dockle.deb" \
    "https://github.com/goodwithtech/dockle/releases/download/v${DOCKLE_VERSION}/dockle_${DOCKLE_VERSION}_Linux-64bit.deb"
dpkg -i "$WORK_DIR/dockle.deb" && rm "$WORK_DIR/dockle.deb"
