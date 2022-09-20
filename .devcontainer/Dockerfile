# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt-get update -y && apt-get upgrade -y && export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y fonts-powerline

ARG HOME="/home/vscode"
WORKDIR $HOME
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k
RUN curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower

RUN sed -i 's/^ZSH_THEME="codespaces"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' .zshrc
RUN echo '' >> .zshrc
RUN echo 'source $HOME/.purepower' >> .zshrc
