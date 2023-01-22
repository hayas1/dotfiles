#! /bin/bash
set -e

for com in curl git zsh; do
    if ! (type $com >/dev/null 2>&1); then
        echo "install $com"
        apt-get update -y && apt-get install -y $com && apt-get clean && rm -rf /var/lib/apt/lists
    fi
done

if [ -e "$HOME/.oh-my-zsh" ]; then
    ### if exist oh-my-zsh, use it
    if [ ! -e "$HOME/.zshrc" ]; then
        # if no .zshrc, get from oh-my-zsh template
        curl -fsL 'https://github.com/ohmyzsh/ohmyzsh/raw/master/templates/zshrc.zsh-template' -o "$HOME/.zshrc"
    fi
    echo '### zsh plugins' >>"$HOME/.zshrc"

    # powerlevel10k
    git clone --depth=1 'https://github.com/romkatv/powerlevel10k.git' "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/themes/powerlevel10k"
    sed -ri 's/^\s*ZSH_THEME="(.*)"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' "$HOME/.zshrc"

    # zsh-completions https://github.com/zsh-users/zsh-completions
    git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions"
    echo 'fpath+=${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-completions/src' >>"$HOME/.zshrc"
    # zsh-autosuggestion https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions"
    sed -ri 's/^\s*plugins=\((.*)\)/plugins=(\1 zsh-autosuggestions)/g' "$HOME/.zshrc"
    # zsh-syntax-highliting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
    git clone 'https://github.com/zsh-users/zsh-syntax-highlighting.git' "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting"
    echo '. ${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >>"$HOME/.zshrc"
    # zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
    git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM:-${ZSH:-$HOME/.oh-my-zsh}/custom}/plugins/zsh-history-substring-search"
    sed -ri 's/^\s*plugins=\((.*)\)/plugins=(\1 zsh-history-substring-search)/g' "$HOME/.zshrc"
    # https://github.com/zdharma/history-search-multi-word#oh-my-zsh-omz
    git clone https://github.com/z-shell/H-S-MW.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/H-S-MW"
    sed -ri 's/^\s*plugins=\((.*)\)/plugins=(\1 H-S-MW)/g' "$HOME/.zshrc"
    echo >>"$HOME/.zshrc"
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
        echo 'zinit light zdharma/history-search-multi-word'
        echo
    } >>"$HOME/.zshrc"
    {
        echo '# ctrl+← ctrl+→'
        echo 'key[Control-Left]="${terminfo[kLFT5]}"'
        echo 'key[Control-Right]="${terminfo[kRIT5]}"'
        echo '[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word'
        echo '[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word'
        echo
    } >>"$HOME/.zshrc"
    {
        echo '# history ↑ ↓'
        echo 'autoload -Uz up-line-or-beginning-search down-line-or-beginning-search'
        echo 'zle -N up-line-or-beginning-search'
        echo 'zle -N down-line-or-beginning-search'
        echo '[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search'
        echo '[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search'
        echo
    } >>"$HOME/.zshrc"

fi
