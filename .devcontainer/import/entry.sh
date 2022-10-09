#! /bin/bash -e

# for develop with go
if type go >/dev/null 2>&1; then
    go install -v golang.org/x/tools/gopls@latest
fi

# for develop with python
if [ -e "$WORKSPACE/requirements.txt" ]; then
    pip install -r "$WORKSPACE/requirements.txt"
fi
