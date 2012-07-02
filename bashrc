
alias ftpush="git-ftp" #Esier to type and remember for pushing websites
# Get some baseball scores
alias score="lynx -nonumbers -dump http://m.mlb.com/sf/ | grep -A1 \"\(Last Game\)\|\(Next Game\)\|\(Live:\)\" | sed '/--/d'"

alias standings="lynx -nonumbers -dump http://m.mlb.com/standings/ | grep 'San Francisco' | awk '{print \"   GB:\",\$6,\$8}'"

# Fancy prompt
function __setprompt {
  local BLUE="\[\033[0;34m\]"
  local NO_COLOUR="\[\033[0m\]"
  local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
  local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
  if [ $SSH2_IP ] || [ $SSH_IP ] ; then
    local SSH_FLAG="@\h"
  fi
  PS1="$BLUE[\$(date +%H:%M)][\u$SSH_FLAG:\w]\\$ $NO_COLOUR"
  PS2="$BLUE>$NO_COLOUR "
  PS4='$BLUE+$NO_COLOUR '
}
__setprompt

##
# Quickly starts a webserver from the current directory.
#
# Thanks to:
# http://superuser.com/questions/52483/terminal-tips-and-tricks-for-mac-os-x
#
# @param [optional, Integer] bind port number, default 8000
serve() {
  $(which python) -m SimpleHTTPServer ${1:-8000}
}

# Set the default editor
if [ -z "$SSH_CLIENT" ] ; then          # for local/console sessions
  case "$TERM" in
  screen*|xterm-256color)               # we're in screen or tmux
    if command -v vim >/dev/null ; then
      export EDITOR="$(which vim)"
    else
      export EDITOR="$(which vi)"
    fi
  ;;
  *)                                      # we're on a normal term console
    if command -v mvim >/dev/null ; then
      case "$TERM_PROGRAM" in
        Apple_Terminal) _terminal="Terminal"  ;;
        iTerm.app)      _terminal="iTerm"     ;;
      esac
      export EDITOR="$(which mvim) -f -c \"au VimLeave * !open -a ${_terminal}\""
      unset _terminal
    elif command -v gvim >/dev/null ; then
      export EDITOR="$(which gvim) -f"
    elif command -v vim >/dev/null ; then
      export EDITOR="$(which vim)"
    else
      export EDITOR="$(which vi)"
    fi
  ;;
  esac
else                                    # for remote/ssh sessions
  if command -v vim >/dev/null ; then
    export EDITOR="$(which vim)"
  else
    export EDITOR="$(which vi)"
  fi
fi
export VISUAL="$EDITOR"

# Number of commands to remember in the command history
export HISTSIZE=10000

# The number of lines contained in the history file
export HISTFILESIZE=999999

# Prepend a timestamp on each history event
export HISTTIMEFORMAT="%Y-%m-%dT%H:%M:%S "


[ -r bashrc.local ] && source bashrc.local
