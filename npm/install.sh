#!/usr/bin/env bash

if ! which npm &> /dev/null; then
    echo "Installing npm"
    sudo curl -L https://npmjs.org/install.sh | sh
fi

if ! which nvm &> /dev/null; then
    echo "Installing nvm"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
fi
