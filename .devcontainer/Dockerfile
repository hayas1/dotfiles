ARG VARIANT="bullseye"
### See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT:-bullseye}

### set home directory for docker
ARG HOME="/home/vscode"
WORKDIR $HOME



### apt update and install
RUN apt-get update -y && apt-get upgrade -y && export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y connect-proxy
RUN apt-get install -y exa ripgrep fd-find bat hexyl


### install google-cloud-sdk
RUN echo '' >> .zshrc
RUN echo 'deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main' | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && apt-get update -y && apt-get install -y google-cloud-sdk


### copy dotfiles
COPY .devcontainer/dotfiles/.bash_aliases .bash_aliases
COPY .devcontainer/dotfiles/.zshrc .zshrc

### get powerlevel10k fonts, however this configuration may need to be done on the host machine.
# RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
# RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
# RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
# RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

### install powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k
# install purepower
RUN curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower
# powerlevel10k setting
COPY .devcontainer/dotfiles/.p10k.zsh .p10k.zsh
ARG USE_NERDFONT=powerline
ENV USE_NERDFONT=${USE_NERDFONT}


### plugins
# zsh-completions https://github.com/zsh-users/zsh-completions
RUN git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
# zsh-autosuggestion https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/local/lib/zsh-syntax-highlighting
# zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
RUN git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-history-substring-search

### for sudo, use same zsh setting
RUN cp -r .bash_aliases .oh-my-zsh .p10k.zsh .purepower .zshrc /root