export EDITOR="vim"
export DOTFILES="$HOME/dotfiles"

export VISUAL="$EDITOR"

# Look in my global composer packages
export PATH=~/dotfiles/composer-packages/vendor/bin:~/dotfiles/bin:$PATH

###########################################################################
#                                  Alias                                  #
###########################################################################

# Some single letter commands
alias v="$EDITOR"
alias g="git"

# Aliases for fat fingered or stupid people
alias :q="exit"
alias :bd="exit"

# Disable DELETE/UPDATE without WHERE
alias mysql='mysql --safe-updates'

###########################################################################
#                            ZSH Configuration                            #
###########################################################################

# Path to your oh-my-zsh configuration.
ZSH_CUSTOM=$DOTFILES/zsh-custom
ZSH=$HOME/.oh-my-zsh

# ZSH theme
ZSH_THEME="captbaritone"

# Red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github git-extras dircycle gem osx tmux vagrant vi-mode brew colored-man extract web-search)

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
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

source $ZSH/oh-my-zsh.sh

# Don't make me confirm history expansions
# This needs to go after we call oh-my-zsh
setopt no_hist_verify

###########################################################################
#                            Source other files                           #
###########################################################################

# Let other namespaces make zsh changes
source $HOME/dotfiles/*/.zshrc

# Customize to your needs...
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
