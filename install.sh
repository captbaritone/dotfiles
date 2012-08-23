#!/bin/sh

cd ~/dotfiles

# Check for some required tools
echo "Checking for commonly used tools"
# git
GIT_IS_AVALIABLE=$?
if [ $GIT_IS_AVALIABLE -eq 0 ]; then
    echo "    OK - Git"
else
    echo "    MISSING - Git"
fi
#
# vim
#   +python
#
# curl
#
# Pull ~/dotfiles?

echo "Updating submodules"
echo "    Vundle..."
git submodule update -q --init ~/dotfiles/vim/bundle/vundle
echo "    z..."
git submodule update -q --init ~/dotfiles/tools/z
#echo "    .ssh..."
#git submodule update -q --init ~/dotfiles/ssh

echo "Updating Vundle bundles"
vim -u ~/.vim/bundles.vim +BundleInstall +qall
echo "    Done"

echo "\nLinking dotfiles into place"
for name in *; do
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'tools' ] && [ "$name" != 'ssh' ]; then
        target="$HOME/.$name"
        if [ "$target" -ef "$name" ]; then
            echo "    OK - .$name"
        else
            if [ -e "$target" ]; then
                mv $target "$target.local"
                echo "    MOVED - $target to $target.local"
            fi
            ln -s "$PWD/$name" "$target"
            echo "    INSTALLED .$name"
        fi
    fi
done

echo "\nInstallation complete. You may wish to issue the following:"
echo "    source ~/.bashrc"
