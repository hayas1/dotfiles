# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ARG USER=vscode
ENV HOME=/home/${USER}

RUN mkdir -p "${HOME}/.config/sheldon"
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/resources/zshrc' -o ${HOME}/.zshrc
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/resources/config/starship.toml' -o ${HOME}/.config/starship.toml
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/resources/config/sheldon/plugins.toml' -o ${HOME}/.config/sheldon/plugins.toml

RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/build/install-tools.sh' | bash -s
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/build/install-terraform.sh' | bash -s
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/build/install-starship-sheldon.sh' | bash -s

RUN chown -R ${USER}:${USER} ${HOME}