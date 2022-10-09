#! /bin/bash -e

### install zsh and oh-my-zsh
if ! (type zsh >/dev/null 2>&1); then
    apt-get update -y && apt-get install -y zsh
    sh -c "$(curl -fsL https://github.com/ohmyzsh/ohmyzsh/raw/master/tools/install.sh)"
fi

### get powerlevel10k fonts, however this configuration may need to be done on the host machine.
# wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
# wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
# wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
# wget -P .fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

### get powerlevel10k
git clone --depth=1 'https://github.com/romkatv/powerlevel10k.git' "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
# get purepower
curl -fsSLO 'https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower' -o "$HOME/.purepower"

### plugins
# zsh-completions https://github.com/zsh-users/zsh-completions
git clone 'https://github.com/zsh-users/zsh-completions' "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}"/plugins/zsh-completions
# zsh-autosuggestion https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone 'https://github.com/zsh-users/zsh-autosuggestions' "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}"/plugins/zsh-autosuggestions
# zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
git clone 'https://github.com/zsh-users/zsh-syntax-highlighting.git' "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}"/plugins/zsh-syntax-highlighting
# zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
git clone 'https://github.com/zsh-users/zsh-history-substring-search' "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}"/plugins/zsh-history-substring-search
