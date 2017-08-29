export EDITOR="vim"
export DOTFILES="$HOME/dotfiles"

export VISUAL="$EDITOR"


source $DOTFILES/aliases.sh
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
plugins=(git github git-extras dircycle gem osx tmux brew colored-man extract tmuxinator)
# Temporarily removed: vi-mode to fix history completion

# Save lots of history
SAVEHIST=1000

# Save it to a file
HISTFILE=~/.history

export TMPDIR=$HOME/tmp

source $ZSH/oh-my-zsh.sh
# Don't make me confirm history expansions
setopt no_hist_verify
# Don't fill in autocomplete if there is ambiguity
setopt no_auto_menu

###########################################################################
#                            Source other files                           #
###########################################################################

# Let other namespaces make zsh changes
source $HOME/dotfiles/*/.zshrc

# Customize to your needs...
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
eval "`npm completion`"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="/Users/jeldredge/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
