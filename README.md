# dotfiles
This is devcontainer image for [VSCode](https://github.com/microsoft/vscode) with mainly [zsh](https://github.com/zsh-users/zsh) + [powerlevel10k](https://github.com/romkatv/powerlevel10k) + tools made by Rust ([exa](https://github.com/ogham/exa), [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd) and so on). This image contains [gcloud](https://github.com/google-cloud-sdk-unofficial/google-cloud-sdk) and some awesome extensions ([GitLens](https://github.com/gitkraken/vscode-gitlens), [Code Spell Checker](https://github.com/streetsidesoftware/vscode-spell-checker), [Thunder Client](https://github.com/rangav/thunder-client-support) and so on). This image allow to install some popular languages such as Python/Go/Node, and tools such as Terraform/Docker/Kubernetes, with using devcontainer [features](https://github.com/devcontainers/features). More detail, see [.devcontainer](/.devcontainer/) directory.

![main screen](/images/main.png)

# Remark
- ***Default shell***: Just after build, terminal will be opened by `bash`. To use `zsh`, execute `zsh` or open new terminal with `+` button.
- ***Local config***: [devcontainer.json](.devcontainer/devcontainer.json) in `master` branch has commented out mounts setting. So, if we want to use `git`/`gcloud`/`kubectl`/etc with local config, enable these settings by uncomment.
- ***Fonts***: To use this image with better icon, we have to install [nerdfont](https://github.com/ryanoasis/nerd-fonts) to our local machine and set it for VSCode like [Manual font installation](https://github.com/romkatv/powerlevel10k/blob/master/font.md#manual-font-installation). If we cannot install it, recommend to comment out `USE_NERDFONT` setting of [devcontainer.json](/.devcontainer/devcontainer.json).

# Scripts for container
## Install zsh and settings and tools
We have some scripts that install some tools for zsh on container.
End of Dockerfile, should be changed home directory owner.
```dockerfile
ENV HOME=/home/${USER}
RUN chown -R ${USER}:${USER} ${HOME}
```

### Usage [install-zsh-plugins.sh](/scripts/public/docker/install-zsh-plugins.sh)
The script will install zsh and some plugins.
```dockerfile
ENV HOME=/home/${USER}
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/scripts/public/docker/install-zsh-plugins.sh' | bash -s
```

### Usage [install-tools-and-set-aliases.sh](/scripts/public/docker/install-tools-and-set-aliases.sh)
The script will install tools and set aliases. **Remark**: this script write aliases settings to only `${HOME}/.zshrc`, so not support `bash`.
```dockerfile
ENV HOME=/home/${USER}
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/scripts/public/docker/install-tools-and-set-aliases.sh' | bash -s
```

### Usage [install-gcloud-kubectl-helm.sh](/scripts/public/docker/install-gcloud-kubectl-helm.sh)
The script will install gcloud and kubectl and helm. **Remark**: this script write completion settings to only `${HOME}/.zshrc`, so not support `bash`.
```dockerfile
ENV HOME=/home/${USER}
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/scripts/public/docker/install-gcloud-kubectl-helm.sh' | bash -s
```
