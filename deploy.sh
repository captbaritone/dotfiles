#!/bin/bash
#
# When run from the dotfiles directory, deploys all the dot files to their rightful
# location via sys links

# Perhaps this should move the original files out of the way first

# Get the parent dir of deploy.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/vim $HOME/.vim
ln -s $DIR/vimrc $HOM/.vimrc
