# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || . ~/.p10k.zsh

# without opening configuration wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# want to update, rebuild container
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

# use purepower
[[ ! -f ~/.purepower ]] || . ~/.purepower

# load plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-autosuggestions zsh-history-substring-search)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
[[ ! -f /usr/local/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || . /usr/local/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ ! -f $ZSH/oh-my-zsh.sh ]] || . $ZSH/oh-my-zsh.sh


# timezone and language environment
export TZ=Asia/Tokyo
# export LANG=ja_JP.UTF-8
setopt print_eight_bit

# Alias definitions.
[[ ! -f ~/.bash_aliases ]] || . ~/.bash_aliases

# gcloud and kubectl completion setting
. /usr/lib/google-cloud-sdk/completion.bash.inc
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# history setting
export HISTSIZE=5000 # history size in memory
export SAVEHIST=100000 # history size in storage
setopt share_history # share same time concurrent zsh history
setopt hist_reduce_blanks # save history without trailing spaces
setopt hist_ignore_all_dups # save history without duplicate

# do not close by ctrl+D
setopt IGNORE_EOF