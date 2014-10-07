#!/usr/bin/env bash

echo "Installing Pip"
# We should test if we already have pip
curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python

sudo pip install \
    pep8 \
    pyflakes
