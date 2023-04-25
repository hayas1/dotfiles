#! /bin/bash -e

# https://starship.rs/#quick-install
curl -fsL https://starship.rs/install.sh | sh -s -- -y

cat <<'EOF' >>"${HOME}/.zshrc"
### load starship
eval "$(starship init zsh)"

EOF
