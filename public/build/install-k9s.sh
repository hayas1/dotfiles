#! /bin/bash -e

K9SVERSION=${K9S_VERSION:-"latest"}
K9SVERSION=${1:-$K9SVERSION}

### install k9s if go exist https://github.com/derailed/k9s#installation
if type go >/dev/null 2>&1; then
    # NOTE: The dev version will be in effect!
    go install "github.com/derailed/k9s@${K9SVERSION}"
else
    echo 'to install k9s, go is needed'
    exit 1
fi
