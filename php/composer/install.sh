#!/usr/bin/env bash

echo "Installing npm"

if ! which composer &> /dev/null; then
    echo "Installing composer"
    curl -sS https://getcomposer.org/installer | php -- --install-dir=~/dotfiles/bin
fi
echo "Installing composer packages"
