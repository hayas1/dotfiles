# dotfiles ![master](https://github.com/hayas1/dotfiles/actions/workflows/master.yml/badge.svg)
This is devcontainer image for [VSCode](https://github.com/microsoft/vscode) with mainly [zsh](https://github.com/zsh-users/zsh) + [powerlevel10k](https://github.com/romkatv/powerlevel10k) + tools made by Rust ([exa](https://github.com/ogham/exa), [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd) and so on). This image contains [gcloud](https://github.com/google-cloud-sdk-unofficial/google-cloud-sdk) and some awesome extensions ([GitLens](https://github.com/gitkraken/vscode-gitlens), [Code Spell Checker](https://github.com/streetsidesoftware/vscode-spell-checker), [Thunder Client](https://github.com/rangav/thunder-client-support) and so on). This image allow to install some popular languages such as Python/Go/Node, and tools such as Terraform/Docker/Kubernetes, with using devcontainer [features](https://github.com/devcontainers/features). More detail, see [.devcontainer](/.devcontainer/) directory and [examples](/examples/) directory.

![main screen](/images/main.png)

## Remark
- ***Default shell***: Just after build, terminal will be opened by `bash`. To use `zsh`, execute `zsh` or open new terminal with `+` button.
- ***Fonts***: To use this image with better icon, we have to install [nerdfont](https://github.com/ryanoasis/nerd-fonts) to our local machine and set it for VSCode like [Manual font installation](https://github.com/romkatv/powerlevel10k/blob/master/font.md#manual-font-installation). If we cannot install it, recommend to comment out `USE_NERDFONT` setting of [devcontainer.json](/.devcontainer/devcontainer.json).

## Devcontainer
See [Examples](/examples/), and copy & paste for our working directory.

## Script only usage
We have some [scripts](/public/build/) that install some tools on container. Every scripts has similar usage, as follow.
```dockerfile
ENV HOME=/home/${USER}
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/build/install-tools.sh' | bash -s -- latest
```

And, end of Dockerfile, should be changed home directory owner.
```dockerfile
ENV HOME=/home/${USER}
RUN chown -R ${USER}:${USER} ${HOME}
```

In addition to scripts, there are some resources [resources](/public/resources/) that have settings for zsh.
Every scripts has similar usage, as follow[^zshrc].
```dockerfile
ENV HOME=/home/${USER}
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/public/resources/.zshrc' -o ${HOME}/.zshrc && zsh ${HOME}/.zshrc
```
Some scripts write to `.zshrc`, so we should get resources before run install-scripts.
[^zshrc]: For the first time only, `.zshrc` downloads several plugins. So, if  `&& zsh ${HOME}/.zshrc` is omitted, the download is performed at the time of initial entry, not at the time of container build.

## Avoid using master
Modify `curl` URL or `git clone` source in `Dockerfile`, as follow.
```dockerfile
ENV HOME=/home/${USER}
RUN curl -fsL 'https://github.com/hayas1/dotfiles/raw/v0.2.0/public/build/install-tools.sh' | bash -s
```

```dockerfile
### copy repository into container
ARG REPOSITORY="${HOME}/.config/dotfiles"
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git && \
    git clone --depth=1 -b v0.2.0 'https://github.com/hayas1/dotfiles.git' ${REPOSITORY}
```