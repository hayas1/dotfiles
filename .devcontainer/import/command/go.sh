#! /bin/bash -e

### for develop with go
if type go >/dev/null 2>&1; then
    go install -v golang.org/x/tools/gopls@latest
    go install -v github.com/cweill/gotests/gotests@latest
    go install -v github.com/fatih/gomodifytags@latest
    go install -v github.com/josharian/impl@latest
    go install -v github.com/haya14busa/goplay/cmd/goplay@latest
    go install -v github.com/go-delve/delve/cmd/dlv@latest
    go install -v honnef.co/go/tools/cmd/staticcheck@latest
fi
