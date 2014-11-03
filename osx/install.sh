#!/usr/bin/env bash

if [ "$(uname)" != "Darwin" ]; then
    exit
fi

if ! which brew &> /dev/null; then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

echo "Installing Brew packages"
brew install \
    ack \
    bash \
    bash-completion \
    coreutils \
    curl \
    encfs \
    ffmpeg \
    findutils \
    fortune \
    gettext \
    gibo \
    gnupg \
    grc \
    imagemagick \
    lynx \
    mosh \
    mutt \
    the_silver_searcher \
    tmux \
    tree \
    unrar \
    watch \
    wget \
    yajl \
    zsh \
    caskroom/cask/brew-cask \

# gettext is needed to fix encfs
# https://github.com/Homebrew/homebrew/issues/29251

# encfs also needs this to install the osxfuse kernel module
# http://apple.stackexchange.com/questions/130838/unable-to-mount-remote-directory-using-sshfs
sudo /bin/cp -RfX /usr/local/opt/osxfuse/Library/Filesystems/osxfusefs.fs /Library/Filesystems
sudo chmod +s /Library/Filesystems/osxfusefs.fs/Support/load_osxfusefs

# GUI applications

brew cask install \
    onepassword \
    bittorrent-sync \
    colloquy \
    firefox \
    google-chrome \
    hermes \
    hipchat \
    iterm2 \
    lilypond \
    seil \
    spectacle \
    transmit \

# Turn off "Play feedback when volume is changed"
defaults write -g "com.apple.sound.beep.feedback" -int 0

###############################################################################
# Dock, Dashboard, and hot corners #
# ###############################################################################


###############################################################################
# Finder #
# ###############################################################################

defaults write com.apple.finder CreateDesktop -bool false

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Restart finder
killall Finder

# Restart so that changes take effect
killall -HUP SystemUIServer

