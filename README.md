# dotfiles
This is devcontainer image for [VSCode](https://github.com/microsoft/vscode) with mainly [zsh](https://github.com/zsh-users/zsh) + [powerlevel10k](https://github.com/romkatv/powerlevel10k) + tools made by Rust ([exa](https://github.com/ogham/exa), [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd) and so on). This image contains [gcloud](https://github.com/google-cloud-sdk-unofficial/google-cloud-sdk) and some awesome extensions ([GitLens](https://github.com/gitkraken/vscode-gitlens), [Code Spell Checker](https://github.com/streetsidesoftware/vscode-spell-checker), [Thunder Client](https://github.com/rangav/thunder-client-support) and so on) for me. This image allow to install some popular languages such as Python/Go/Node, and tools such as Terraform/Docker/Kubernetes, with using devcontainer [features](https://github.com/devcontainers/features). More detail, see [.devcontainer](/.devcontainer/) directory.

![main screen](/images/main.png)

# Remark
- ***Default shell***: Just after build, terminal will be opened by `bash`. To use `zsh`, execute `zsh` or open new terminal with `+` button.
- ***Local config***: [devcontainer.json](.devcontainer/devcontainer.json) in `master` branch has commented out mounts setting. So, if we want to use `git`/`gcloud`/`kubectl`/etc with local config, enable these settings by uncomment.
- ***Fonts***: To use this image with better icon, we have to install [nerdfont](https://github.com/ryanoasis/nerd-fonts) to our local machine and set it for VSCode like [Manual font installation](https://github.com/romkatv/powerlevel10k/blob/master/font.md#manual-font-installation). If we cannot install it, recommend to comment out `USE_NERDFONT` setting of [devcontainer.json](/.devcontainer/devcontainer.json).

# Initialize and cleanup
## Simple
Copy [.devcontainer](/.devcontainer/) directory to our workspace, and customize files, and build devcontainer.

## Use scripts
We have simple scripts [init.sh](/scripts/public/init.sh) and [clean.sh](/scripts/public/clean.sh). We can prepare and cleanup workspace with these scripts.

### Usage [init.sh](/scripts/public/init.sh)
The script will clone this repository to temporary directory, and execute [devc-init.sh](/scripts/devc-init.sh). The temporary directory is removed after initialization.
```sh:input
$ curl -fsL https://raw.githubusercontent.com/hayas1/dotfiles/master/scripts/public/init.sh | bash -s
```
```sh:output
Cloning into '/tmp/dotfiles.20220928204937.ztw9B2'...
remote: Enumerating objects: 607, done.
remote: Counting objects: 100% (244/244), done.
remote: Compressing objects: 100% (139/139), done.
remote: Total 607 (delta 108), reused 182 (delta 72), pack-reused 363
Receiving objects: 100% (607/607), 307.95 KiB | 165.00 KiB/s, done.
Resolving deltas: 100% (250/250), done.
### this is simple copy program ###
>>> made new directory .vscode
>>> made new directory .devcontainer
cleaned tmp dir /tmp/dotfiles.20220928204937.ztw9B2
```

### Usage [clean.sh](/scripts/public/clean.sh)
The script will clone this repository to temporary directory, and execute [devc-clean.sh](/scripts/devc-clean.sh). The temporary directory is removed after initialization.
```sh:input
bash <(curl -fsL https://raw.githubusercontent.com/hayas1/dotfiles
/master/scripts/public/clean.sh)
```
```sh:output
Cloning into '/tmp/dotfiles.20220928205212.if1Jck'...
remote: Enumerating objects: 607, done.
remote: Counting objects: 100% (244/244), done.
remote: Compressing objects: 100% (139/139), done.
remote: Total 607 (delta 108), reused 182 (delta 72), pack-reused 363
Receiving objects: 100% (607/607), 307.95 KiB | 729.00 KiB/s, done.
Resolving deltas: 100% (250/250), done.
### this is simple remove program ###
>>> really remove .vscode? [y/N]y
... file .vscode moved to /tmp/dotfiles.remove.20220928205213.6DWXec
^^^ want to recover, try $ mv /tmp/dotfiles.remove.20220928205213.6DWXec/.* .
>>> really remove .devcontainer? [y/N]y
... file .devcontainer moved to /tmp/dotfiles.remove.20220928205213.6DWXec
^^^ want to recover, try $ mv /tmp/dotfiles.remove.20220928205213.6DWXec/.* .
cleaned tmp dir /tmp/dotfiles.20220928205212.if1Jck
```


<!-- # Installation -->
<!-- ## Use script
We have a simple script [devc-init.sh](/scripts/devcinit.sh) to prepare workspace. Clone this repository appropriate path (such as `/usr/lib/`) and make symbolic link for it in `Path` set directory (such as `/usr/bin`). We make workspace and execute the script.
```sh
$ git clone https://github.com/hayas1/dotfiles.git /usr/lib/
$ ln -s /usr/lib/dotfiles/scripts/devc.sh /usr/bin/devc
```
And example of usage.
```sh
$ mkdir ./workspace && cd $_
$ devc init
### this is simple copy program ###
>>> made new directory .vscode
>>> made new directory .devcontainer
```
### Script dependencies
Some subcommands (such as simple `init` or `update`) can be executed without Python, but a lot of subcommands require Python 3. -->