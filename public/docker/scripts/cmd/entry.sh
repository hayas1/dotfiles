#! /bin/bash -e

COMMAND_DIR="$(dirname "$(realpath "$0")")"

"$COMMAND_DIR/python.sh"
"$COMMAND_DIR/go.sh"

"$COMMAND_DIR/workspace.sh"

"$COMMAND_DIR/docker.sh"
