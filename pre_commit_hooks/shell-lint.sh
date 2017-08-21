#!/bin/bash

echo "begin shellcheck/lint" 

which shellcheck &> /dev/null
if [[ $? != 0 ]]; then
    echo "are you sure you have installed shellcheck?"
    exit 1
fi

for f in $(git diff --cached --name-only | grep .sh$); do
    shellcheck "$(git rev-parse --show-toplevel)/$f"
done
exit $?
