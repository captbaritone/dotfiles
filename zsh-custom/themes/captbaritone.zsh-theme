# Custom theme based on "ys
#

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✓"

# Prompt format: \n # [TIME]: USER has JOBS at MACHINE in DIRECTORY on BRANCH STATE 
PROMPT="
╭─%{$terminfo[bold]$fg[blue]%}[%T]%{$reset_color%}: %{$fg[cyan]%}%n \
%(1j.%{$fg[white]%}has %{$fg[yellow]%}%j .)\
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${git_info} \
%{$terminfo[bold]$fg[red]%}
%{$reset_color%}╰─➤ "
