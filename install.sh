#!/bin/sh

for name in *; do
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
        target="$HOME/.$name"
        if [ -L "$target" ] && [ `readlink -f $target` = "$PWD/$name" ]; then
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
