#! /bin/bash -e

if [ -e "$WORK_SPACE/requirements.txt" ]; then
    pip install -r "$WORK_SPACE/requirements.txt"
fi
