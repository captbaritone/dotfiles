## DotFiles

This is my personal collection of "dotfiles". Having them in a github
repository allows me to easily clone them on any machine I find myself on.

## Install

In the home directory:

    git clone git://github.com/captbaritone/dotfiles
    git submodule update --init


Then deplay (symbolically link) the files into your home dir

    dotfiles/deploy install


## Deploy Help

The deploy file was forked from `dot-files` by [Bartman](https://github.com/bartman/dot-files)

    
    deploy - manages symlink files from ~/dotfiles/* to ~/.*

    Syntax: deploy [ <command> ] [ <options> ]

    Commands:

        list                   - list all dotfiles files
        status                 - status of available files
        install [-v] [-f] [-s] - installs symlinks

    Options:
            -v                     - be verbose
            -f                     - force updates
            -s                     - skip over existing files
