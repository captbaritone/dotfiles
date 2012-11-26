# If not running interactively, don't do anything
[ -z "$PS1" ] && return

###########################################################################
#                         Source ~/.bashrc.local                          #
###########################################################################

# Source the local bashrc file first, so it doesn't override any of our
[ -r "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

# Use colors for ls
export CLICOLOR=1

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
        # OSX already does this
        #alias open="open"
        ;;
esac

###########################################################################
#                              Fancy Prompt                               #
###########################################################################

# https://raw.github.com/paulirish/dotfiles/master/.bash_prompt
source $HOME/.bash_prompt

###########################################################################
#                             z shell command                             #
###########################################################################

. $HOME/dotfiles/tools/z/z.sh

##
# Quickly starts a webserver from the current directory.
#
# Thanks to:
# http://superuser.com/questions/52483/terminal-tips-and-tricks-for-mac-os-x
#
# @param [optional, Integer] bind port number, default 8000
server() {
    $(which python) -m SimpleHTTPServer ${1:-8000}
}

###########################################################################
#                Detect the best version of vim avalaible                 #
###########################################################################


# Set the default editor
if [ -z "$SSH_CLIENT" ] ; then          # for local/console sessions
#  case "$TERM" in
#  screen*|xterm-256color)               # we're in screen or tmux
#    if command -v vim >/dev/null ; then
#      export EDITOR="$(which vim)"
#    else
#      export EDITOR="$(which vi)"
#    fi
#  ;;
#  *)                                      # we're on a normal term console
    if command -v mvim >/dev/null ; then
      case "$TERM_PROGRAM" in
        Apple_Terminal) _terminal="Terminal"  ;;
        iTerm.app)      _terminal="iTerm"     ;;
      esac
      export EDITOR="open -a 'MacVim'"
      unset _terminal
    elif command -v gvim >/dev/null ; then
      export EDITOR="gvim --remote-silent"
    elif command -v vim >/dev/null ; then
      export EDITOR="vim"
    else
      export EDITOR="vi"
    fi
#  ;;
#  esac
else                                    # for remote/ssh sessions
  if command -v vim >/dev/null ; then
    export EDITOR="vim"
  else
    export EDITOR="vi"
  fi
fi
export VISUAL="$EDITOR"

# Stolen from: https://github.com/janmoesen/tilde/blob/master/.bash/commands
# Enable simple aliases to be sudo'ed. ("sudone"?)
# http://www.gnu.org/software/bash/manual/bashref.html#Aliases says: "If the
# last character of the alias value is a space or tab character, then the next
# command word following the alias is also checked for alias expansion."
alias sudo='sudo ';

# I want "vim" to be the best available version
alias vim="$EDITOR"

# Some single letter commands
alias v="vim"
alias g="git"

# Enable autocomplete for g
complete -o default -o nospace -F _git g
alias w="cd ~/Work && ls"
alias s="cd ~/Sites && ls"
alias o="open"
alias t="open -a 'Transmit'"
function p() { open "$@" -a "Adobe Photoshop CS6"; }
function i() { open "$@" -a "Adobe Illustrator CS6"; }

alias cpu="open -a 'Activity Monitor'"
alias mem="open -a 'Activity Monitor'"

alias todo="vim ~/todo.txt"
alias irc="irssi"

# Aliases for fat fingered or stupid people
alias :q="exit"
alias :bd="exit"

# Disable DELETE/UPDATE without WHERE
alias mysql='mysql --safe-updates'

# Stolen from: https://github.com/janmoesen/tilde/blob/master/.bash/commands
# Standardize cipboard access. Cygwin, Linux and OS X.
if command -v pbpaste >/dev/null; then
	alias getclip='pbpaste';
	alias putclip='pbcopy';
elif command -v xclip >/dev/null; then
	alias getclip='xclip --out';
	alias putclip='xclip --in';
fi;

# Look for project details matching a regex
function pw() {
  dir=`ls ~/Work | grep -i "$@"`;
  if [ "$dir" == '' ]; then
   echo "No project matching \"$@\""; 
   return;
  fi
  path="~/Work/$dir"
  info="$path/info.md" 
  if [ -f "$info" ]; then
    echo "Info for $path"
    vim "~/Work/$path/info.md"
  else
    echo $info;
    echo "No info.md found in $path"
  fi
}

###########################################################################
#                             History Options                             #
###########################################################################


# Number of commands to remember in the command history
export HISTSIZE=10000

# The number of lines contained in the history file
export HISTFILESIZE=999999

# Prepend a timestamp on each history event
export HISTTIMEFORMAT="%Y-%m-%dT%H:%M:%S "

# Up/Down arrows autocomplete what I have already started
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# I wish I could issue this as `git root`
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
