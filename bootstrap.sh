#! /bin/bash

# This script will bootstrap a Linux, or OS X machine to a useful state by:
# - Fetching and installing my dotfile configs

# It can be run with any of the following commands:
# `curl classicalcode.com | sh`
# `wget -o - classicalcode.com | sh`
# `lynx -source classicalcode.com | sh`

# Settings
dotfiles="$HOME/dotfiles"
dotrepo="http://github.com/captbaritone/dotfiles"

# Do the dot files
if [ ! -d "$dotfiles" ]; then
    printf "Fetching dotfiles...\n"
    git clone "$dotrepo" "$dotfiles"
fi;

printf "Installing/updating dotfiles...\n"
source "$dotfiles/install.sh"
printf "\nTo get the most recent bashrc need to issue \`bash\`\n"
