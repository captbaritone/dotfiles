#! /bin/bash

# Installs or updates all settings and configurations
# 
# TODO:
#   Don't try submodules if no git
#   Check success of submodule updates
#   Test if we can get ssh?
#   Test success of Vundle update
#   
#     Could run git clone for us?
#     Can't depend of either wget or curl :(

dotfilespath="$HOME/dotfiles"
dotfilerepo="git@github.com:captbaritone/dotfiles"

guidespath="$HOME/guides"
guidesrepo="http://github.com/captbaritone/guides.git"


txtrst=$(tput sgr0) # Text reset
txtred=$(tput setaf 9) # Red
txtgreen=$(tput setaf 190) # Green
txtorange=$(tput setaf 172) # Orange
indent="    "
ok(){ printf "${indent}${txtgreen}OK${txtrst}\n"; }
moved(){ printf "${indent}${txtgreen}MOVED${txtrst}\n"; }
installed(){ printf "${indent}${txtgreen}INSTALLED${txtrst}\n"; }
notice(){ printf "${indent}${txtorange}NOTICE${txtrst}\n"; }
missing(){ printf "${indent}${txtred}MISSING${txtrst}\n"; }

# Check for some required tools
printf "Checking for required tools:\n"
# git
if [ `command -v git` ]; then
  printf "$(ok) - Git\n"
else
    printf "    MISSING - Git\n"
    printf "You seriously expect me to do this without git?. Fix that shit.\n"
    exit
fi

# vim
if [ `command -v vim` ]; then
    printf "$(ok) - Vim\n"
    #   +python?
    if [ "$(vim --version | grep \+python)" ]; then
        printf "$(ok) - Vim +python\n"
    else
        printf "$(missing) - Vim +python (Gundo won't work)\n"
    fi
else
    printf "$(missing) - Vim\n"
fi


printf "Updating dotfiles:\n"
cd "$dotfilespath"
# Is the dotfiles repository clean?
if [[ $(git status 2> /dev/null | tail -n1 | cut -c1-17) = "nothing to commit" ]]; then
  if [[ $(git pull 2> /dev/null) = "Already up-to-date." ]]; then
    printf "$(ok) - Already up-to-date\n"
  else
    printf "$(ok) - Updated dotfiles\n"
    printf "\n\nStarting over now that we have newer dotfiles...\n\n\n"
    $(./install.sh)
    exit;
    # Perhaps here we should start over with the new install.sh?
  fi
else
  printf "$(missing) - Did not update dotfiles (unclean)\n"
fi

printf "Linking dotfiles into place:\n"
for name in *; do
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'tools' ] && [ "$name" != 'ssh' ] && [ "$name" != 'bootstrap.sh' ] && [ "$name" != 'zsh-custom' ] && [ "$name" != 'composer-packages' ]; then
        target="$HOME/.$name"
        if [ "$target" -ef "$name" ]; then
            printf "$(ok) - .$name\n"
        else
            if [ -e "$target" ]; then
                mv $target "$target.local"
                printf "$(moved) - $target to $target.local\n"
            fi
            ln -s "$PWD/$name" "$target"
            printf "$(installed) - .$name\n"
        fi
    fi
done

printf "Updating guides:\n"
# Get my guides
if [ -d $guidespath ]; then
    cd "$guidespath"
    if [[ $(git status 2> /dev/null | tail -n1 | cut -c1-17) = "nothing to commit" ]]; then
        if [[ $(git pull 2> /dev/null) = "Already up-to-date." ]]; then
            printf "$(ok) - Already up-to-date\n"
        else
            printf "$(ok) - Updated guides\n"
        fi
    else
        printf "$(notice) - Did not update guides (unclean)\n"
    fi
else
    cd $HOME
    if [[ $(git clone $guidesrepo $guidespath 2> /dev/null) ]]; then
        printf "$(installed) - Guides cloned\n"
    fi
fi;

printf "Updating submodules:\n"
git submodule update -q --init $HOME/dotfiles/vim/bundle/vundle
printf "$(ok) - Vundle\n"
#git submodule update -q --init $HOME/dotfiles/tools/z
#printf "$(ok) - Z\n"
#printf "    .ssh..."
#git submodule update -q --init ~/dotfiles/ssh

printf "Updating Vundle bundles:\n"
vim -u ~/.vim/bundles.vim "+BundleInstall" +qall
printf "$(ok) - Install bundles\n"
printf "Removing old Vundle bundles:\n"
vim -u ~/.vim/bundles.vim "+BundleClean!" +qall
printf "$(ok) - Clean bundles\n"

printf "Checking for recommended tools\n"
# oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]
then
    $(curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh)
    rm $HOME/.zshrc
else
  printf "$(ok) - oh-my-zsh\n"
fi
# curl
if [ `command -v curl` ]; then
    printf "$(ok) - Curl\n"
else
  printf "$(missing) - Curl (Vim-Gist won't work)\n"
fi


printf "\nInstallation complete!\n"
