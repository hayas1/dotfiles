#! /bin/bash
set -e

apt-get update -y && apt-get upgrade -y &&
    apt-get install -y curl wget procps htop git connect-proxy sudo \
        exa ripgrep fd-find bat hexyl &&
    apt-get clean && rm -rf /var/lib/apt/lists
