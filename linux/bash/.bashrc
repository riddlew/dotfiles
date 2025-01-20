# COLOR_NC='\e[0m'
# COLOR_BLACK='\e[0;30m'
# COLOR_GRAY='\e[1;30m'
# COLOR_RED='\e[0;31m'
# COLOR_BRIGHT_RED='\e[1;31m'
# COLOR_GREEN='\e[0;32m'
# COLOR_BRIGHT_GREEN='\e[1;32m'
# COLOR_BROWN='\e[0;33m'
# COLOR_YELLOW='\e[1;33m'
# COLOR_BLUE='\e[0;34m'
# COLOR_BRIGHT_BLUE='\e[1;34m'
# COLOR_PURPLE='\e[0;35m'
# COLOR_BRIGHT_PURPLE='\e[1;35m'
# COLOR_CYAN='\e[0;36m'
# COLOR_LIGHT_CYAN='\e[1;36m'
# COLOR_LIGHT_GRAY='\e[0;37m'
# COLOR_WHITE='\e[1;37m'
COLOR_NC='\[\033[00m\]'
COLOR_BLACK='\[\033[0;30m\]'
COLOR_GRAY='\[\033[1;30m\]'
COLOR_RED='\[\033[0;31m\]'
COLOR_BRIGHT_RED='\[\033[1;31m\]'
COLOR_GREEN='\[\033[0;32m\]'
COLOR_BRIGHT_GREEN='\[\033[1;32m\]'
COLOR_BROWN='\[\033[0;33m\]'
COLOR_YELLOW='\[\033[1;33m\]'
COLOR_BLUE='\[\033[0;34m\]'
COLOR_BRIGHT_BLUE='\[\033[1;34m\]'
COLOR_PURPLE='\[\033[0;35m\]'
COLOR_BRIGHT_PURPLE='\[\033[1;35m\]'
COLOR_CYAN='\[\033[0;36m\]'
COLOR_LIGHT_CYAN='\[\033[1;36m\]'
COLOR_LIGHT_GRAY='\[\033[0;37m\]'
COLOR_WHITE='\[\033[1;37m\]'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

PS1="\n${debian_chroot:+($debian_chroot)}\T \u [${COLOR_BRIGHT_BLUE}\w${COLOR_NC}]${COLOR_BRIGHT_GREEN}\$(parse_git_branch)${COLOR_NC}\n❯ "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|alacritty)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [[ $TERM == "dumb" ]]; then
  export PS1="$ "
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f /usr/share/zsh/vendor-completions/alacritty.bash ]; then
  source /usr/share/zsh/vendor-completions/alacritty.bash
fi

# Starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

# Zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init bash)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# .NET completion
function _dotnet_bash_complete()
{
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n' # On Windows you may need to use use IFS=$'\r\n'
  local candidates

  read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)

  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}
complete -f -F _dotnet_bash_complete dotnet

# Rust Cargo
if command -v cargo >/dev/null 2>&1; then
  . "$HOME/.cargo/env"
fi


##############################################
# linux only                                 #
##############################################

