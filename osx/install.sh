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
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

echo "Installing Brew packages"
brew install \
    ack \
    bash \
    bash-completion \
    caskroom/cask/brew-cask \
    coreutils \
    curl \
    encfs \
    ffmpeg \
    findutils \
    fortune \
    gettext \
    ghostscript \
    gibo \
    gnupg \
    grc \
    imagemagick \
    lynx \
    mosh \
    mutt \
    node \
    redis \
    sox \
    ssh-copy-id \
    the_silver_searcher \
    tmux \
    tree \
    unrar \
    watch \
    wget \
    yajl \
    zsh \


# GUI applications

brew cask install \
    onepassword \
    colloquy \
    firefox \
    google-chrome \
    hermes \
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

