FROM debian:latest

### proxy setting
# ARG http_proxy
# ARG HTTP_PROXY
# ARG https_proxy
# ARG HTTPS_PROXY
# ARG no_proxy
# ARG NO_PROXY
# ENV http_proxy=${http_proxy} HTTP_PROXY=${HTTP_PROXY}
# ENV https_proxy=${https_proxy} HTTPS_PROXY=${HTTPS_PROXY}
# ENV no_proxy=${no_proxy} NO_PROXY=${NO_PROXY}

### user setting
ARG UID
ARG GID=${UID}
ARG USERNAME
ARG GROUPNAME=${USERNAME}
RUN apt-get update && apt-get install sudo && groupadd --gid $GID $USERNAME &&\
    useradd -s /bin/bash --uid $UID --gid $GID -m $USERNAME &&\
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL >/etc/sudoers.d/$USERNAME && chmod 0440 /etc/sudoers.d/$USERNAME


### set home directory for docker and devc's directory
ARG HOME="${HOME:-/home/$USERNAME}"
ARG DEVC_CONFIG="${HOME}/.devc"
ARG WORKSPACE="${HOME}/workspace"
ENV HOME=${HOME}
ENV DEVC_CONFIG="${DEVC_CONFIG}"
ENV DEVC_IMPORT="${DEVC_CONFIG}/import/build"
ENV WORKSPACE=${WORKSPACE}
WORKDIR $HOME

### install features
# copy scripts
COPY .devcontainer/import ${DEVC_CONFIG}/import/
# install tools
RUN ${DEVC_IMPORT}/tools.sh
# install zsh and plugins
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
# install terraform
RUN ${DEVC_IMPORT}/terraform.sh
# install gcloud and kubectl and helm
RUN ${DEVC_IMPORT}/gcloud-kubectl-helm.sh
# install docker linter and scanner
RUN ${DEVC_IMPORT}/docker.sh

### copy dotfiles
COPY .devcontainer/resources/ ${HOME}/

### for sudo, use same zsh setting
RUN cp -r .bash_aliases .oh-my-zsh .p10k.zsh .purepower .zshrc /root
RUN echo "export http_proxy=${http_proxy}" >> /root/.bashrc &&\
    echo "export HTTP_PROXY=${HTTP_PROXY}" >> /root/.bashrc &&\
    echo "export https_proxy=${https_proxy}" >> /root/.bashrc &&\
    echo "export HTTPS_PROXY=${HTTPS_PROXY}" >> /root/.bashrc &&\
    echo "export no_proxy=${no_proxy}" >> /root/.bashrc &&\
    echo "export NO_PROXY=${NO_PROXY}" >> /root/.bashrc