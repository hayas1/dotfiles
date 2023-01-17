# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -s ~/.p10k.zsh ]] && source ~/.p10k.zsh

# use purepower
[[ -s ~/.purepower ]] ||
    curl -fsL 'https://github.com/romkatv/dotfiles-public/raw/master/.purepower' -o "$HOME/.purepower"
[[ -s ~/.purepower ]] && source ~/.purepower

# without opening configuration wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# timezone and language environment
export TZ=Asia/Tokyo
# export LANG=ja_JP.UTF-8
setopt print_eight_bit

# Alias definitions.
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases

# history setting
export HISTSIZE=5000        # history size in memory
export SAVEHIST=100000      # history size in storage
setopt share_history        # share same time concurrent zsh history
setopt hist_reduce_blanks   # save history without trailing spaces
setopt hist_ignore_all_dups # save history without duplicate

# want to update, rebuild container
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

# do not close by ctrl+D
setopt IGNORE_EOF

# powerlevel10k
[[ -s "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/themes/powerlevel10k" ]] ||
    git clone --depth=1 https://github.com/romkatv/powerlevel10k "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/themes/powerlevel10k"

# zsh-completions https://github.com/zsh-users/zsh-completions
[[ -s "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions" ]] ||
    git clone --depth=1 https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions"
# zsh-autosuggestion https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
[[ -s "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions" ]] ||
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions"
# zsh-syntax-highliting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
[[ -s "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting" ]] ||
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting"
# zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
[[ -s "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-history-substring-search" ]] ||
    git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-history-substring-search"
# https://github.com/zdharma/history-search-multi-word#oh-my-zsh-omz
[[ -s "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/H-S-MW" ]] ||
    git clone --depth=1 https://github.com/z-shell/H-S-MW "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/H-S-MW"

# load plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-autosuggestions zsh-history-substring-search H-S-MW)
fpath+=${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions/src
. ${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -s $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
