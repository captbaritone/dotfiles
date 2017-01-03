#!/usr/bin/env bash

dotfilespath="$HOME/dotfiles"

FILES=(\
    bashrc \
    gitconfig \
    gitignore \
    hyper.js \
    tmux.conf \
    vim \
    vimrc \
    zshenv \
    zshrc \
)

# The destination path of a dotfile
function dot_path () {
    echo "$HOME/.$1"
}

# The destination path of a dotfile
function local_path () {
    echo "$HOME/.$1.local"
}

# Links the passed filename to its new location
function link () {
    local filename=$1
    if [[ ! -e $filename ]]; then
        echo "$filename doesn't exist"
        return
    fi

    local path=$(dot_path $filename)
    if [[ -f $path ]] && [[ ! -L $path ]]; then
        local localpath=$(local_path $filename)
        mv $path $localpath
        echo "Moved: $path to $localpath"
    fi

    if [[ -L $path ]]; then
        echo "Ok: $path"
    elif [[ ! -e $path ]]; then
        echo "Linking: $filename to $path"
        ln -s $PWD/$filename $path
    fi
}

# Loops through and link all files without links
function install_links () {
    echo "Linking dotfiles into place:\n"
    cd $dotfilespath
    for FILE in ${FILES[@]}
    do
        link $FILE
    done
}

install_links

echo "Running module install files:"
find . -mindepth 2 -name 'install.sh' | while read FILE; do
    echo $FILE
    $FILE
done

echo "Installation complete!"
