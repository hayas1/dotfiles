#! /bin/sh
python --version && pip --version &&
    npm --version && # nvm --version  && # nvm is shell function
    go version &&
    cargo --version && rustc --version && rustup --version &&
    docker --version &&
    sudo tfenv install latest && sudo tfenv use latest && terraform --version &&
    gcloud version && kubectl version --client --output=yaml && helm version --client && k9s version
