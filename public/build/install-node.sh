#! /bin/bash -e

VERSION=${NODE_VERSION:-"latest"}
VERSION=${1:-$VERSION}

# https://github.com/nvm-sh/nvm#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

if [ "$VERSION" = "latest" ]; then
    VERSION="node"
elif [ "$VERSION" = "lts" ]; then
    VERSION="lts/*"
fi
nvm install "$VERSION" && nvm clear-cache

cat <<'EOF' >>"$HOME/.zshrc"
### nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion

EOF
