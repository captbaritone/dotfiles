if [ -f $HOME/.bash_profile.local ]; then
    . $HOME/.bash_profile.local
fi
PATH=~/dotfiles/tools/j:$PATH
source $HOME/.bashrc
