# Path to your oh-my-zsh configuration.
ZSH_CUSTOM=$HOME/dotfiles/zsh-custom
ZSH=$HOME/.oh-my-zsh

# ZSH theme
ZSH_THEME="captbaritone"

export EDITOR="vim"

export VISUAL="$EDITOR"

###########################################################################
#                                  Alias                                  #
###########################################################################

# Some single letter commands
alias v="$EDITOR"
alias g="git"
alias serve="python -m SimpleHTTPServer&"

# Aliases for fat fingered or stupid people
alias :q="exit"
alias :bd="exit"

# Disable DELETE/UPDATE without WHERE
alias mysql='mysql --safe-updates'

# Ssh to my work VM and attach to tmux
alias dev="ssh dev -t tmux attach -d"

# Hearsay specific
alias pr="./lgtm create"
alias manage="./run.sh manage.py --settings=settings.jeldredge"
alias shell="./run.sh manage.py shell --settings=settings.jeldredge --organization=1"
alias logs="tail -f /var/log/fm/jeldredge.log"
alias celery="./scripts/start_celeryd.sh"
alias ship="./lgtm create"

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
        ;;
    darwin*)
        alias prank="osascript -e 'set volume 7' && say --voice Whisper "
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
plugins=(git github git-extras dircycle gem osx tmux vagrant vi-mode brew colored-man extract web-search)

# Don't ask for confirmation for history expansion

# Don't fill in autocomplete if there is ambiguity
setopt no_auto_menu

# Save lots of history
SAVEHIST=1000
# Save it to a file
HISTFILE=~/.history
export TMPDIR=$HOME/tmp

# Autocomplete from history with arrow keys
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Make "v" open current line in my editor
export VISUAL=vim
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Customize to your needs...
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

# Look in my global composer packages
export PATH=~/dotfiles/composer-packages/vendor/bin:~/dotfiles/bin:$PATH
# Look in this project's vendor/bin directory
export PATH=vendor/bin:$PATH

source $ZSH/oh-my-zsh.sh

# Don't make me confirm history expansions
# This needs to go after we call oh-my-zsh
setopt no_hist_verify
