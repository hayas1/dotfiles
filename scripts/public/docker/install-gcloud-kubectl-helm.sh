#! /bin/bash
set -e

curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/.devcontainer/import/build/gcloud-kubectl-helm.sh' | bash -s

{
    echo '### gcloud kubectl helm completion setting'
    echo 'source /usr/lib/google-cloud-sdk/completion.bash.inc'
    echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)'
    echo 'source <(helm completion zsh)'
} >>"$HOME/.zshrc"
