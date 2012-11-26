#! /bin/bash

# This script will bootstrap a Linux, or OS X machine to a useful state by:
# - Fetching and installing my dotfile configs

# It can be run with any of the following commands:
# `curl classicalcode.com | sh`
# `wget -o - classicalcode.com | sh`
# `lynx -source classicalcode.com | sh`

# TODO: 
# - Check for package manger and install needed packages
# - Figure out sudo needs for above
# - Place this file in a repo that gets pushed to classicalcode
# - Come up with a name for my bootstrap/dotfile setup
# - Double check default/desired permissions for install.sh
# - Check for git/ruby before trying things?
# - What does mkdir do if the dir already exists?

# Settings
dotfiles="$HOME/dotfiles"
dotrepo="http://github.com/captbaritone/dotfiles"
tmp="$HOME/tmp"

# apt-get install curl git-core irssi lame mplayer vim wget 
# brew install irssi wget vim tmux

# Here we could test for osx an then install homebrew if it's missing
# There should also be a list of "apps" that should either be downloaded or
# installed from the app store.

# Install some ruby gems
#gem install sass        # Sass css preprossesor 

# Do the dot files
if [ -d $dotfiles ]; then
    echo "Updating dotfiles..."
    cd $dotfiles
    git pull
else
    echo "Fetching dotfiles..."
    git clone $dotrepo $dotfiles
fi;

echo "Setting file permissions..."
#chmod 770 $dotfiles/install.sh
echo "Installing dotfiles..."
$dotfiles/install.sh

# Create a user tmp dir
mkdir -p "$tmp"
