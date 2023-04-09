#! /bin/bash -e

VERSION=${TERRAFORM_VERSION:-"latest"}
VERSION=${1:-$VERSION}
INSTALL_PATH="/usr/lib/tfenv"

# https://github.com/tfutils/tfenv#manual
apt-get update -y && apt-get install -y zip &&
    apt-get clean && rm -rf /var/lib/apt/lists
git clone https://github.com/tfutils/tfenv.git "$INSTALL_PATH"
ln -s "$INSTALL_PATH/bin/tfenv" /usr/bin/tfenv
ln -s "$INSTALL_PATH/bin/terraform" /usr/bin/terraform

tfenv install "$VERSION"
tfenv use "$VERSION"
