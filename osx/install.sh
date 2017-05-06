#!/usr/bin/env bash

# Manual insalls
# Private Internet Access
# Spotify
# Sonos
# Virtualbox
# Caffeine

if [ "$(uname)" != "Darwin" ]; then
    exit
fi

if ! which brew &> /dev/null; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing Brew packages"
brew install \
    ack \
    bash \
    bash-completion \
    caskroom/cask/brew-cask \
    coreutils \
    curl \
    ffmpeg \
    fortune \
    ghostscript \
    gibo \
    gnupg \
    grc \
    imagemagick \
    lynx \
    node \
    redis \
    sox \
    ssh-copy-id \
    the_silver_searcher \
    tmux \
    tree \
    unrar \
    watch \
    watchman \
    wget \
    yajl \
    zsh \


# GUI applications

brew cask install \
    dropbox \
    caffeine \
    firefox \
    google-chrome \
    hermes \
    slack \
    hyper \
    iterm2 \
    1password \
    spectacle \
    transmit \
    visual-studio-code \

# Turn off "Play feedback when volume is changed"
defaults write -g "com.apple.sound.beep.feedback" -int 0

###############################################################################
# Dock, Dashboard, and hot corners #
# ###############################################################################

# TODO: Enable locking the screen when I mouse to the upper left corner.

###############################################################################
# Finder #
# ###############################################################################

# Hide icons on the desktop
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

