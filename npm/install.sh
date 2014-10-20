#!/usr/bin/env bash

echo "Installing npm"

if ! which npm &> /dev/null; then
    echo "Installing npm"
    curl -L https://npmjs.org/install.sh | sh
fi
echo "Installing npm packages"
sudo npm install jshint
