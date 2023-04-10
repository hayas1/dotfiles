# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ARG USER=vscode
ENV HOME=/home/${USER}
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/resources/.bash_aliases' -o ${HOME}/.bash_aliases
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/resources/.p10k.zsh' -o ${HOME}/.p10k.zsh
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/resources/.zshrc' -o ${HOME}/.zshrc
RUN zsh ${HOME}/.zshrc

RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/build/install-oh-my-zsh.sh' | bash -s
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/build/install-tools.sh' | bash -s
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/build/install-terraform.sh' | bash -s

RUN mkdir "${HOME}/.config" && chown -R ${USER}:${USER} ${HOME}