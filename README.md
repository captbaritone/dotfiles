Dotfiles
========

This is my personal collection of "dotfiles". Having them in a github
repository allows me to easily clone them on any machine I find myself on.

Install
-------

In the home directory:

    git clone git://github.com/captbaritone/dotfiles
    git submodule update --init


Then deploy (symbolically link) the files into your home dir

    cd dotfiles
    ./install.sh


install.sh
----------

`install.sh` will symlink all the dotfiles (every file in `dotfiles` except
`README.md` and `install.sh`) into your home dir. If the dotfile already
exists, and is not the correct symlink, it will be moved to `$FILENAME.local`
with the expectation that the repository version of the dotfile will source it.
This allows for per-machine customization.
