#! /bin/bash -e

### for develop with python
if [ -e "./requirements.txt" ]; then
    pip install -r "./requirements.txt"
fi

### for develop with go
if type go >/dev/null 2>&1; then
    go install -v golang.org/x/tools/gopls@latest
fi
