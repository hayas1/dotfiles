#! /bin/sh -e

DIR=$(dirname "$(realpath "$0")")
SAMPLE=$(dirname "$DIR")/sample/
[ "$(python "$SAMPLE"/hello.py)" = "Hello World" ]
[ "$(node "$SAMPLE"/hello.js)" = "Hello World" ]
[ "$(go run "$SAMPLE"/hello.go)" = "Hello World" ]
[ "$(rustc -o "$SAMPLE"/hello-rs "$SAMPLE"/hello.rs && "$SAMPLE"/hello-rs)" = "Hello World" ]
[ -e "$SAMPLE"/hello-rs ] && rm "$SAMPLE"/hello-rs
