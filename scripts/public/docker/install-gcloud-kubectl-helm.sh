#! /bin/bash
set -e

apt-get update -y && apt-get install -y gnupg &&
    apt-get clean && rm -rf /var/lib/apt/lists
curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/.devcontainer/import/build/gcloud-kubectl-helm.sh' | bash -s

{
    echo '### gcloud kubectl helm completion setting'
    echo 'source /usr/share/google-cloud-sdk/completion.zsh.inc'
    echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)'
    echo 'source <(helm completion zsh)'
} >>"$HOME/.zshrc"
