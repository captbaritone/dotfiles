#!/bin/bash
#
# When run from the dotfiles directory, deploys all the dot files to their rightful
# location via sys links

# Perhaps this should move the original files out of the way first
# Found some good info here: http://stackoverflow.com/questions/5238019/using-bash-to-automate-dotfiles

for f in ~/dotfiles/*
do
    if [[ $f = 'deploy.sh' ]]; then continue; fi
    ln -s "$f" "$HOME/.${f##*/}"
done

