#! /bin/bash
set -e

### install git and curl
apt-get update -y && apt-get install -y git curl && apt-get clean && rm -rf /var/lib/apt/lists

### install zsh
if ! (type zsh >/dev/null 2>&1); then
    apt-get update -y && apt-get install -y zsh && apt-get clean && rm -rf /var/lib/apt/lists
fi

if [ -e "${HOME}/.oh-my-zsh" ]; then
    ### if exist oh-my-zsh, use it
    if [ ! -e ~/.zshrc ]; then
        # if no .zshrc, get from oh-my-zsh template
        curl -fsL 'https://github.com/ohmyzsh/ohmyzsh/raw/master/templates/zshrc.zsh-template' -o "${HOME}/.zshrc"
    fi
    echo '### zsh plugins' >>"${HOME}/.zshrc"

    # powerlevel10k
    git clone --depth=1 'https://github.com/romkatv/powerlevel10k.git' "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/themes/powerlevel10k"
    sed -ri 's/^\s*ZSH_THEME="(.*)"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' "${HOME}/.zshrc"

    # zsh-completions https://github.com/zsh-users/zsh-completions
    git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-completions"
    echo 'fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src' >>"${HOME}/.zshrc"
    # zsh-autosuggestion https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions"
    sed -ri 's/^\s*plugins=\((.*)\)/plugins=(\1 zsh-autosuggestions)/g' "${HOME}/.zshrc"
    # zsh-syntax-highliting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
    git clone 'https://github.com/zsh-users/zsh-syntax-highlighting.git' "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting"
    echo '. ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >>"${HOME}/.zshrc"
    # zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
    git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM:-${ZSH:-${HOME}/.oh-my-zsh}/custom}/plugins/zsh-history-substring-search"
    sed -ri 's/^\s*plugins=\((.*)\)/plugins=(\1 zsh-history-substring-search)/g' "${HOME}/.zshrc"
else
    ### if not exist oh-my-zsh, use zinit # TODO use sheldon
    echo 'y' | bash -c "$(curl -fsSL https://git.io/zinit-install)"
    {
        echo '### zsh plugins'
        echo 'zinit light romkatv/powerlevel10k'
        echo 'zinit light zsh-users/zsh-completions'
        echo 'zinit light zsh-users/zsh-autosuggestions'
        echo 'zinit light zsh-users/zsh-syntax-highlighting'
        echo 'zinit light zsh-users/zsh-history-substring-search'
    } >>"${HOME}/.zshrc"
fi

# purepower and some settings
curl -fsL 'https://github.com/romkatv/dotfiles-public/raw/master/.purepower' -o "${HOME}/.purepower"
curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/.devcontainer/resources/.p10k.zsh' -o "${HOME}/.p10k.zsh"
echo '[ -e ~/.p10k.zsh ] && source ~/.p10k.zsh' >>"${HOME}/.zshrc"
