#! /bin/bash

echo "Updating/cleaning Vim plugins:"

# Thanks for greywh in #vim for this tip
vim -E -s <<-EOF
    :source ~/.vimrc
    :PlugInstall
    :PlugClean
    :qa
EOF
