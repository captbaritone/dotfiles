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

cd ~/dotfiles

txtrst=$(tput sgr0) # Text reset
txtred=$(tput setaf 9) # Red
txtgreen=$(tput setaf 190) # Green
txtorange=$(tput setaf 172) # Orange
indent="    "
ok(){ echo "${indent}${txtgreen}OK${txtrst}"; }
notice(){ echo "${indent}${txtorange}NOTICE${txtrst}"; }
missing(){ echo "${indent}${txtred}MISSING${txtrst}"; }

# Check for some required tools
echo "Checking for commonly used tools:"
# git
if [ `command -v git` ]; then
  echo -e "$(ok) - Git"
else
    echo "    MISSING - Git"
    echo -e "\nYou serioulsy expect me to do this witout git?. Fix that shit."
    exit
fi
# vim
if [ `command -v vim` ]; then
    echo "$(ok) - Vim"
    #   +python?
    if [ "$(vim --version | grep \+python)" ]; then
        echo "$(ok) - Vim +python"
    else
        echo "$(missing) - Vim +python (Gundo won't work)"
    fi
else
    echo "$(missing) - Vim"
fi

# curl
if [ `command -v curl` ]; then
    echo "$(ok) - Curl"
else
  echo "$(missing) - Curl (Vim-Gist won't work)"
fi

echo "Updating dotfiles:"
# Is the dotfiles repo clean?
if [[ $(git status 2> /dev/null | tail -n1 | cut -c1-17) = "nothing to commit" ]]; then
  if [[ $(git pull 2> /dev/null) = "Already up-to-date." ]]; then
    echo "$(ok) - Already up-to-date"
  else
    echo "$(ok) - Updated dotfiles (you may want to rerun install.sh)"
    # Perhaps here we should start over with the new install.sh?
  fi
else
  echo "$(notice) - Did not update dotfiles (unclean)"
fi


echo "Updating submodules:"
git submodule update -q --init ~/dotfiles/vim/bundle/vundle
echo "$(ok) - Vundle"
git submodule update -q --init ~/dotfiles/tools/z
echo "$(ok) - Z"
#echo "    .ssh..."
#git submodule update -q --init ~/dotfiles/ssh

echo "Updating Vundle bundles:"
vim -u ~/dotfiles/vim/bundles.vim +BundleInstall +qall
echo "$(ok)"

echo "Linking dotfiles into place:"
for name in *; do
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != 'tools' ] && [ "$name" != 'ssh' ]; then
        target="$HOME/.$name"
        if [ "$target" -ef "$name" ]; then
            echo "$(ok) - .$name"
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

echo -e "\nInstallation complete. You may wish to issue the following:"
echo "    . ~/.bashrc"
