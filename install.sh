#!/bin/sh

cd "~/dotfiles"

echo "\nUpdating submodules..."
git submodule update -q --init
echo "Done"

echo "\nLinking dotfiles into place"
for name in *; do
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'tools' ]; then
        target="$HOME/.$name"
        if [ "$target" -ef "$name" ]; then
            echo "OK - .$name"
        else
            if [ -e "$target" ]; then
                mv $target "$target.local"
                echo "MOVED - $target to $target.local"
            fi
            ln -s "$PWD/$name" "$target"
            echo "INSTALLED .$name"
        fi
    fi
done

echo "\nInstallation complete. You may wish to issue the following:"
echo "        source ~/.bashrc"
