### See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

### set home directory for docker
ARG HOME="/home/vscode"
WORKDIR $HOME

### proxy setting
ARG http_proxy
ARG HTTP_PROXY
ARG https_proxy
ARG HTTPS_PROXY
ARG no_proxy
ARG NO_PROXY
ENV http_proxy=${http_proxy} HTTP_PROXY=${HTTP_PROXY}
ENV https_proxy=${https_proxy} HTTPS_PROXY=${HTTPS_PROXY}
ENV no_proxy=${no_proxy} NO_PROXY=${NO_PROXY}
RUN apt-get install -y connect-proxy


### apt update and install tools implemented by rust
RUN apt-get update -y && apt-get upgrade -y && export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y exa ripgrep fd-find bat hexyl


### copy dotfiles
COPY .devcontainer/dotfiles/.bash_aliases .bash_aliases
RUN echo '' >> .zshrc
RUN echo '. ~/.bash_aliases' >> .zshrc


### install google-cloud-sdk and kubectl
RUN echo '' >> .zshrc
RUN echo 'deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main' | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && apt-get update -y && apt-get install -y google-cloud-sdk kubectl
RUN echo '# gcloud and kubectl completion setting' >> .zshrc
RUN echo '. /usr/lib/google-cloud-sdk/completion.bash.inc' >> .zshrc
RUN echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)' >> ~/.zshrc


### get powerlevel10k fonts, however this configuration may need to be done on the host machine.
# RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
# RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
# RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
# RUN wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

### install powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git .oh-my-zsh/custom/themes/powerlevel10k
RUN sed -i 's/^ZSH_THEME="codespaces"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' .zshrc
# install purepower
RUN curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower
RUN echo '' >> .zshrc
RUN echo '. $HOME/.purepower' >> .zshrc
# powerlevel10k setting
RUN echo '# without opening configuration wizard' >> .zshrc
RUN echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> .zshrc
RUN echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> .zshrc
RUN echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> .zshrc
COPY .devcontainer/dotfiles/.p10k.zsh .p10k.zsh
ARG USE_NERDFONT=powerline
ENV USE_NERDFONT=${USE_NERDFONT}


### plugins
RUN echo '' >> .zshrc
# zsh-completions https://github.com/zsh-users/zsh-completions
RUN git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
RUN echo 'fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src' >> .zshrc
# zsh-autosuggestion https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions
RUN sed -ri 's/^\s*plugins=\((.*)\)/plugins=(\1 zsh-autosuggestions)/g' .zshrc
# zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/local/lib/zsh-syntax-highlighting
RUN echo '. /usr/local/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> .zshrc
# zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
RUN git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-history-substring-search
RUN sed -ri 's/^\s*plugins=\((.*)\)/plugins=(\1 zsh-history-substring-search)/g' .zshrc


### settings
ENV TZ=Asia/Tokyo
# ENV LANG=ja_JP.UTF-8
RUN echo '' >> .zshrc
RUN echo 'setopt print_eight_bit' >> .zshrc