# FROM mcr.microsoft.com/vscode/devcontainers/base:0-bullseye
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
ARG HOME="${HOME:-/home/$USERNAME}"
RUN apt-get update && apt-get install sudo && groupadd --gid $GID $USERNAME &&\
    useradd -s /bin/bash --uid $UID --gid $GID -m $USERNAME &&\
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL >/etc/sudoers.d/$USERNAME && chmod 0440 /etc/sudoers.d/$USERNAME
RUN mkdir "${HOME}/.config" && chown -R "${UID}:${GID}" "${HOME}/.config"

### copy repository into container
ARG REPOSITORY="${HOME}/.config/dotfiles"
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git && \
    git clone --depth=1 -b master 'https://github.com/hayas1/dotfiles.git' ${REPOSITORY}

### copy resources
RUN cp "${REPOSITORY}/public/resources/.zshrc" "${HOME}/.zshrc" && \
    cp "${REPOSITORY}/public/resources/.bash_aliases" "${HOME}/.bash_aliases" && \
    cp "${REPOSITORY}/public/resources/.p10k.zsh" "${HOME}/.p10k.zsh"

### install tools
RUN "${REPOSITORY}/public/build/install-tools.sh" && \
    "${REPOSITORY}/public/build/install-oh-my-zsh.sh" && \
    zsh ${HOME}/.zshrc
RUN "${REPOSITORY}/public/build/install-python.sh" latest && \
    "${REPOSITORY}/public/build/install-node.sh" latest && \
    "${REPOSITORY}/public/build/install-go.sh" latest && \
    "${REPOSITORY}/public/build/install-rust.sh" latest && \
    "${REPOSITORY}/public/build/install-terraform.sh" latest && \
    "${REPOSITORY}/public/build/install-gcloud-kubectl-helm.sh" && \
    "${REPOSITORY}/public/build/install-gh.sh" && \
    "${REPOSITORY}/public/build/install-hadolint-dockle.sh" && \
    "${REPOSITORY}/public/build/install-k9s.sh"

### for sudo, use same zsh setting
RUN cp -r "${HOME}/.bash_aliases" "${HOME}/.oh-my-zsh" "${HOME}/.p10k.zsh" "${HOME}/.zshrc" /root && \
    echo "export http_proxy=${http_proxy}" >> /root/.bashrc &&\
    echo "export HTTP_PROXY=${HTTP_PROXY}" >> /root/.bashrc &&\
    echo "export https_proxy=${https_proxy}" >> /root/.bashrc &&\
    echo "export HTTPS_PROXY=${HTTPS_PROXY}" >> /root/.bashrc &&\
    echo "export no_proxy=${no_proxy}" >> /root/.bashrc &&\
    echo "export NO_PROXY=${NO_PROXY}" >> /root/.bashrc