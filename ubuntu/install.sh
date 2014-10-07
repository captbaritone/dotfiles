#!/usr/bin/env bash

command -v apt-get || exit

echo "Installing Ubuntu apt-get packages"
sudo apt-get update
sudo apt-get install --assume-yes \
    curl \
    git \
    lynx \
    silversearcher-ag \
    tree \
    vim \
    vim-gnome \
    zsh \
