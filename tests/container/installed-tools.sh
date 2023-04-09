#! /bin/sh
python --version && pip --version &&
    npm --version && # nvm --version  && # nvm is shell function
    go version &&
    cargo --version && rustc --version && rustup --version &&
    docker --version &&
    sudo tfenv install latest && sudo tfenv use latest && terraform --version &&
    echo q | gcloud --help && kubectl --help && helm --help
