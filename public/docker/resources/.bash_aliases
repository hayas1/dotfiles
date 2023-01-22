#! /bin/bash
if [[ $USE_NERDFONT == nerdfont-complete ]]; then
    ICONS='--icons'
else
    ICONS=''
fi

if type exa >/dev/null 2>&1; then
    alias ls='exa --git $ICONS'
    alias la='exa -a $ICONS'
    alias ll='exa -aal $ICONS'
    alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" $ICONS'
    alias ltl='exa -T -L 3 -a -I "node_modules|.git|.cache" -l $ICONS'
fi

if type rg >/dev/null 2>&1; then
    alias grep=rg
fi

if type htop >/dev/null 2>&1; then
    alias psp=htop
fi

if type batcat >/dev/null 2>&1; then
    alias cat='batcat --paging=never --style=header --theme=TwoDark'
    alias less='batcat --theme=TwoDark'
fi

if type hexyl >/dev/null 2>&1; then
    alias odp=hexyl
fi

if type fdfind >/dev/null 2>&1; then
    # alias find=fdfind
    alias fd=fdfind
fi
