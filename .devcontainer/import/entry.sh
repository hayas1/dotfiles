#! /bin/bash -e

### for develop with go
if type go >/dev/null 2>&1; then
    go install -v golang.org/x/tools/gopls@latest
fi

### for develop with python
if [ -e "$WORKSPACE/requirements.txt" ]; then
    pip install -r "$WORKSPACE/requirements.txt"
fi

### for docker-from-docker
export DOCKER_BUILDKIT=1
sudo apt-get update && curl -fsL "https://github.com/microsoft/vscode-dev-containers/raw/main/script-library/docker-debian.sh" | sudo bash
/usr/local/share/docker-init.sh
