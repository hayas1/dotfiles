#! /bin/bash -e

REPOSITORY="$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")"
REPOSITORY_DEVC="${REPOSITORY}/.devcontainer"
EXAMPLE_CLONE="${REPOSITORY}/examples/clone"
EXAMPLE_DEVC="${EXAMPLE_CLONE}/.devcontainer"
TESTDATA="${REPOSITORY}/tests/examples/data/clone"

for f in Dockerfile devcontainer.json entry.sh; do
    diff <(diff "${REPOSITORY_DEVC}/${f}" "${EXAMPLE_DEVC}/${f}" | grep '<') "${TESTDATA}/${f}-current.diff"
    diff <(diff "${REPOSITORY_DEVC}/${f}" "${EXAMPLE_DEVC}/${f}" | grep '>') "${TESTDATA}/${f}-incoming.diff"
done
