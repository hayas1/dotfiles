#! /bin/bash
if [[ $USE_NERDFONT == nerdfont-complete ]]; then
    ICONS='--icons'
else
    ICONS=''
fi

alias ls='exa --git $ICONS'
alias la='exa -a $ICONS'
alias ll='exa -aal $ICONS'
alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" $ICONS'
alias ltl='exa -T -L 3 -a -I "node_modules|.git|.cache" -l $ICONS'
alias grep=rg
alias psp=htop
alias cat='batcat --paging=never --style=header'
alias less=batcat
alias odp=hexyl
# alias find=fdfind
alias fd=fdfind
