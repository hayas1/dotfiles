### See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt-get update -y && apt-get upgrade -y && export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y fonts-powerline

### install powerlevel10k
ARG HOME="/home/vscode"
WORKDIR $HOME
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k
RUN curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower
RUN sed -i 's/^ZSH_THEME="codespaces"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' .zshrc
RUN echo '' >> .zshrc
RUN echo 'source $HOME/.purepower' >> .zshrc

### settings
ENV TZ=Asia/Tokyo
# ENV LANG=ja_JP.UTF-8
RUN echo ''
RUN echo 'setopt print_eight_bit' >> .zshrc

