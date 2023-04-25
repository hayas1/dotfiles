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
COPY ./ ${REPOSITORY}

### copy resources
RUN cp "${REPOSITORY}/public/resources/zshrc" "${HOME}/.zshrc" && \
    cp "${REPOSITORY}/public/resources/config/starship.toml" "${HOME}/.config/starship.toml" && \
    mkdir -p "${HOME}/.config/sheldon" && \
    cp "${REPOSITORY}/public/resources/config/sheldon/plugins.toml" "${HOME}/.config/sheldon/plugins.toml"

### install tools
RUN "${REPOSITORY}/public/build/install-tools.sh" && \
    "${REPOSITORY}/public/build/install-python.sh" latest && \
    "${REPOSITORY}/public/build/install-node.sh" latest && \
    "${REPOSITORY}/public/build/install-go.sh" latest && \
    "${REPOSITORY}/public/build/install-rust.sh" latest && \
    "${REPOSITORY}/public/build/install-terraform.sh" latest && \
    "${REPOSITORY}/public/build/install-gcloud-kubectl-helm.sh" && \
    "${REPOSITORY}/public/build/install-gh.sh" && \
    "${REPOSITORY}/public/build/install-hadolint-dockle.sh" && \
    "${REPOSITORY}/public/build/install-k9s.sh" && \
    "${REPOSITORY}/public/build/install-starship-sheldon.sh"

### owner
RUN chown -R ${USERNAME}:${USERNAME} ${HOME}