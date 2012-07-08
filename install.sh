#!/bin/sh

for name in *; do
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'tools' ]; then
        target="$HOME/.$name"
        if [ "$target" -ef "$PWD/$name" ]; then
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

echo "Installation complete. You may wish to \`source ~/.bashrc\` to get up to date"
