#! /bin/bash -e

### for develop with python
if [ -e "$WORKSPACE/requirements.txt" ]; then
    pip install -r "$WORKSPACE/requirements.txt"
fi
