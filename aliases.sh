###########################################################################
#                                  Alias                                  #
###########################################################################

# Some single letter commands
alias v="$EDITOR"
alias vim="$EDITOR"
alias g="git"
alias w="$EDITOR ~/cloud/vimwiki/index.wiki"

# Aliases for fat fingered or stupid people
alias :q="exit"
alias :Q="exit"
alias :bd="exit"
alias :Bd="exit"
alias :BD="exit"
alias ZZ="exit"

# Disable DELETE/UPDATE without WHERE
alias mysql='mysql --safe-updates'

# Pretty print json blobs
alias pprint="python -mjson.tool"
alias a="vim ~/dotfiles/aliases.sh"

NUCLIDE_PATH="~/fbsource/fbobjc/Tools/Nuclide/"
# Nuclide
alias n="cd $NUCLIDE_PATH"
alias fix="DEVSERVER=jeldredge.sb.facebook.com ./scripts/fb-devserver-setup"
alias fb="ssh jeldredge.sb.facebook.com"
alias a="atom --dev ."
alias ab="atom-beta --dev ."
alias nab="atom-beta --dev $NUCLIDE_PATH"
alias p="cd ~/p"
alias p="cd ~/p"
