#! /bin/bash
set -e

### install required tools
apt-get update -y && apt-get install -y gnupg &&
    apt-get clean && rm -rf /var/lib/apt/lists

### install gcloud and kubectl https://cloud.google.com/sdk/docs/install?hl=ja#deb
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" |
    tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg |
    apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update -y && apt-get install -y google-cloud-sdk kubectl

### install helm https://helm.sh/docs/intro/install/#from-apt-debianubuntu
curl https://baltocdn.com/helm/signing.asc |
    gpg --dearmor | tee /usr/share/keyrings/helm.gpg >/dev/null
apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" |
    tee /etc/apt/sources.list.d/helm-stable-debian.list
apt-get update -y && apt-get -y install helm

cat <<'EOF' >>"$HOME/.zshrc"
### gcloud kubectl helm completion setting
source /usr/share/google-cloud-sdk/completion.zsh.inc
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
source <(helm completion zsh)
EOF
