# oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]
then
    echo "Installing Oh My Zsh"
    curl -L http://install.ohmyz.sh | sh
    # Put my ~/.zshrc file back
    rm ~/.zshrc
    mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
    ln -s 
fi

