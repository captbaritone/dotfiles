#!/usr/bin/env bash

if ! which npm &> /dev/null; then
    echo "Installing npm"
    sudo curl -L https://npmjs.org/install.sh | sh
fi
echo "Installing npm packages"
sudo npm install jshint
sudo npm install gulp -g
