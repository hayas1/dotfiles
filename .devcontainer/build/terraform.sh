#! /bin/bash -e

# # https://www.terraform.io/cli/install/apt
# apt-get update -y && apt-get install -y lsb-release &&
#     apt-get clean && rm -rf /var/lib/apt/lists
# wget -O- https://apt.releases.hashicorp.com/gpg |
#     gpg --dearmor |
#     tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
# gpg --no-default-keyring \
#     --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
#     --fingerprint
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
#     https://apt.releases.hashicorp.com $(lsb_release -cs) main" |
#     tee /etc/apt/sources.list.d/hashicorp.list
# apt-get update -y && apt-get install -y terraform

# tfenv
apt-get update -y && apt-get install -y zip &&
    apt-get clean && rm -rf /var/lib/apt/lists
INSTALL_PATH="$HOME/tfenv"
git clone https://github.com/tfutils/tfenv.git "$INSTALL_PATH"
ln -s "$INSTALL_PATH/bin/tfenv" /usr/bin/tfenv
ln -s "$INSTALL_PATH/bin/terraform" /usr/bin/terraform
