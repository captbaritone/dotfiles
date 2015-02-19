#!/usr/bin/env bash

command -v apt-get || exit

echo "Installing Ubuntu apt-get packages"

# For mosh
sudo apt-get install python-software-properties
sudo add-apt-repository -y ppa:keithw/mosh

# For neovim
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update
sudo apt-get install --assume-yes \
    ca-certificates \
    curl \
    git \
    locate \
    lynx \
    mosh \
    neovim \
    php5 php5-cli \
    python-software-properties \
    mutt \
    offlineimap \
    silversearcher-ag \
    tree \
    vim \
    vim-gnome \
    weechat \
    zsh \
