# key config
bindkey "^[[1;5C" forward-word                   # ctrl+<-
bindkey "^[[1;5D" backward-word                  # ctrl+->
zstyle ':completion:::::default' menu yes select # tab completion
setopt IGNORE_EOF                                # do not close by ctrl+D

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

### specified settings ###
