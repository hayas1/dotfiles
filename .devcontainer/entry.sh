#! /bin/bash -e

### workspace entry setting
pip install black

DEVC="$(dirname "$(realpath "$0")")"
ROOT="$(dirname "$(realpath "$DEVC")")"
CMD=$ROOT/public/docker/scripts/cmd

"$CMD"/entry.sh
