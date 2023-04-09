#! /bin/sh -e

DIR=$(dirname "$(realpath "$0")")
SAMPLE=$(dirname "$DIR")/sample/
TMP=$(mktemp -dt "dotfiles-test-hello-$(date +%Y%m%d%H%M%S)-XXXXXX")
[ "$(python "$SAMPLE"/hello.py)" = "Hello World" ] &&
    [ "$(node "$SAMPLE"/hello.js)" = "Hello World" ] &&
    [ "$(go run "$SAMPLE"/hello.go)" = "Hello World" ] &&
    [ "$(rustc -o "$TMP"/hello-rs "$SAMPLE"/hello.rs && "$TMP"/hello-rs)" = "Hello World" ]
