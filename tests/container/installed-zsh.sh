#! /bin/sh
REPOSITORY="$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")"
zsh -c exit &&
    # diff "${REPOSITORY}/public/resources/.zshrc" "${HOME}/.zshrc" 1>&2 &&
    diff "${REPOSITORY}/public/resources/config/starship.toml" "${HOME}/.config/starship.toml" 1>&2 &&
    diff "${REPOSITORY}/public/resources/config/sheldon/plugins.toml" "${HOME}/.config/sheldon/plugins.toml" 1>&2
