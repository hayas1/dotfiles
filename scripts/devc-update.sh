#!/bin/bash -e
echo '### this is simple update program with git ###'

usage() {
    # TODO
    echo "usage of init"
}

REPO_ROOT=$(dirname "$(dirname "$(realpath "$0")")")
cd "$REPO_ROOT"
git pull
