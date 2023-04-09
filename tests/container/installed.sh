#! /bin/sh

DIR=$(dirname "$(realpath "$0")")
TESTS=$(dirname "$DIR")
REPOSITORY=$(dirname "$TESTS")

python "$TESTS/build/postbuild.py" test-installed-extensions "$REPOSITORY/.devcontainer/devcontainer.json" &&
    "$DIR"/installed-zsh.sh && "$DIR"/installed-tools.sh && "$DIR"/installed-hello.sh
