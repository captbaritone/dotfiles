# Path to your oh-my-zsh configuration.
ZSH_CUSTOM=$HOME/dotfiles/zsh-custom
ZSH=$HOME/.oh-my-zsh

# ZSH theme
ZSH_THEME="captbaritone"

###########################################################################
#                Detect the best version of vim available                 #
###########################################################################

# Set the default editor
if [ -z "$SSH_CLIENT" ] ; then          # for local/console sessions
    if command -v mvim >/dev/null ; then
      export EDITOR="mvim"
    elif command -v gvim >/dev/null ; then
      export EDITOR="gvim --remote-silent"
    elif command -v vim >/dev/null ; then
      export EDITOR="vim"
    else
      export EDITOR="vi"
    fi
else                                    # for remote/ssh sessions
  if command -v vim >/dev/null ; then
    export EDITOR="vim"
  else
    export EDITOR="vi"
  fi
fi
export VISUAL="$EDITOR"

###########################################################################
#                                  Alias                                  #
###########################################################################

# Some single letter commands
alias v="$EDITOR"
alias g="git"
alias o="open"
alias refit="$HOME/dotfiles/install.sh"
alias todo="vim $HOME/todo.txt"
alias irc="weechat-curses"

# Aliases for fat fingered or stupid people
alias :q="exit"
alias :bd="exit"

# Disable DELETE/UPDATE without WHERE
alias mysql='mysql --safe-updates'

# Functions

# Get the dimensions of an image
function size () {
    convert "$1" -print "%w x %h" /dev/null
}

###########################################################################
#                          OS Dependent Options                           #
###########################################################################

case "$OSTYPE" in
    cygwin)
        alias open="cmd /c start"
        ;;
    linux*)
        # fix the ubuntu bug which spits out an error message after launching gvim
        function gvim () { (/usr/bin/gvim -f "$@" &) }
        alias open="xdg-open"
        alias vpn="safejumper"
        ;;
    darwin*)
        # OSX already does this
        #alias open="open"
        alias t="open -a 'Transmit'"
        function p() { open "$@" -a "Adobe Photoshop CS6"; }
        function i() { open "$@" -a "Adobe Illustrator CS6"; }
        alias cpu="open -a 'Activity Monitor'"
        alias mem="open -a 'Activity Monitor'"
        alias vpn="open -a 'Tunnelblick'"
        ;;
esac

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras dircycle gem osx tmux vagrant vi-mode brew colored-man extract)

# Make up/down arrows complete from history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Customize to your needs...
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

source $ZSH/oh-my-zsh.sh

