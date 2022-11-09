#! /bin/bash -e

### for docker-from-docker
export DOCKER_BUILDKIT=1
sudo -i apt-get update && curl -fsL "https://github.com/microsoft/vscode-dev-containers/raw/main/script-library/docker-debian.sh" | sudo -i bash
/usr/local/share/docker-init.sh
