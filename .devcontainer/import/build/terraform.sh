#! /bin/bash -e

# https://www.terraform.io/cli/install/apt
apt-get update -y && apt-get install -y lsb-release &&
    apt-get clean && rm -rf /var/lib/apt/lists
wget -O- https://apt.releases.hashicorp.com/gpg |
    gpg --dearmor |
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" |
    sudo tee /etc/apt/sources.list.d/hashicorp.list
apt-get update -y && apt-get install -y terraform
