#! /bin/bash
set -e

apt-get update -y && apt-get upgrade -y &&
    apt-get install -y curl wget procps htop git connect-proxy sudo \
        exa ripgrep fd-find bat hexyl &&
    apt-get clean && rm -rf /var/lib/apt/lists

cat <<'EOF' >>"${HOME}/.bash_aliases"
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
alias cat='batcat --paging=never --style=header --theme=TwoDark'
alias less='batcat --theme=TwoDark'
alias odp=hexyl
# alias find=fdfind
alias fd=fdfind
EOF

# curl -fsL 'https://github.com/hayas1/dotfiles/raw/master/.devcontainer/resources/.bash_aliases' >>"${HOME}/.bash_aliases"
# echo '[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases' >>"${HOME}/.zshrc"
