#!/usr/bin/env bash

command -v apt-get || exit

echo "Installing Ubuntu apt-get packages"

# For neovim
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update
sudo apt-get install --assume-yes \
    ca-certificates \
    curl \
    git \
    locate \
    lynx \
    neovim \
    python-software-properties \
    silversearcher-ag \
    tree \
    vim \
    weechat \
    zsh \
