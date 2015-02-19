#!/usr/bin/env bash

if ! which pip &> /dev/null; then
    echo "Installing Pip"
    # We should test if we already have pip
    curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python
fi

sudo pip install \
    neovim \
    pep8 \
    pyflakes
