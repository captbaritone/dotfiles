#!/usr/bin/env bash

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


echo "Set zsh as shell"
chsh -s $(which zsh) $USER
if [[ ! -z "$SUDO_USER" ]];then
    chsh -s $(which zsh) $SUDO_USER
fi
