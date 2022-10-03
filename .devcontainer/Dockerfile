### See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/base:0-bullseye

### set home directory for docker and devc's directory
ARG HOME="/home/vscode"
ARG DEVC_CONFIG="${HOME}/.devc"
ENV DEVC_CONFIG="${DEVC_CONFIG}"
ENV DEVC_IMPORT="${DEVC_CONFIG}/import"
WORKDIR $HOME

### copy dotfiles and scripts
COPY .devcontainer/resources/ ${HOME}/
COPY .devcontainer/import ${DEVC_CONFIG}/import/

### apt update and install tools
RUN apt-get update -y && apt-get upgrade -y && export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y connect-proxy exa ripgrep fd-find bat hexyl

### install features
# install powerlevel10k and plugins
RUN ${DEVC_IMPORT}/zsh-plugins.sh
# install python
ARG PYTHON_VERSION="latest"
RUN ${DEVC_IMPORT}/python.sh ${PYTHON_VERSION}
# install node
ARG NODE_VERSION="latest"
RUN ${DEVC_IMPORT}/node.sh ${NODE_VERSION}
# install go
ARG GO_VERSION="latest"
RUN ${DEVC_IMPORT}/go.sh ${GO_VERSION}
# install rust
ARG RUST_VERSION="latest"
RUN ${DEVC_IMPORT}/rust.sh ${RUST_VERSION}
# install gcloud and kubectl and helm
RUN ${DEVC_IMPORT}/gcloud-kubectl-helm.sh

### for sudo, use same zsh setting
RUN cp -r .bash_aliases .oh-my-zsh .p10k.zsh .purepower .zshrc /root
