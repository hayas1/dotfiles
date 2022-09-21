### See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN apt-get update -y && apt-get upgrade -y && export DEBIAN_FRONTEND=noninteractive

### set home directory for docker
ARG HOME="/home/vscode"
WORKDIR $HOME

### get powerlevel10k fonts, however this configuration may need to be done on the host machine.
# RUN apt-get install -y fonts-powerline
RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
### install powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k
RUN sed -i 's/^ZSH_THEME="codespaces"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' .zshrc
### install purepower
RUN curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower
RUN echo '' >> .zshrc
RUN echo 'source $HOME/.purepower' >> .zshrc

### settings
ENV TZ=Asia/Tokyo
# ENV LANG=ja_JP.UTF-8
RUN echo ''
RUN echo 'setopt print_eight_bit' >> .zshrc

### plugins
RUN git clone https://github.com/zsh-users/zsh-autosuggestions .oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN sed -i 's/plugins=\((.*)\)/plugins=(git zsh-autosuggestions)/g' .zshrc
