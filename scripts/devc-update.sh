#!/bin/sh -e
echo '\e[36m###\e[m this is simple update program with git \e[36m###\e[m'

REPO_ROOT=$(dirname "$(dirname "$(realpath "$0")")")
cd "$REPO_ROOT"
git pull
