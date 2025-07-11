# ~/.bashrc: executed by bash(1) for non-login shells.

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
# Timestamped history
HISTTIMEFORMAT='%d/%m %H:%M '
# Host specific history file (useful on NFS mounted home directories)
HISTFILE=~/.bash_history.$(uname -n)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

color_prompt=

HOSTNAME=$(uname -n)
if [ $(uname -n) == 'Pauls-MacBook-Pro.local' ]; then
  HOSTNAME=macbook
fi
export HOSTNAME

MYUSER="paulhaldane"

PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
unset color_prompt force_color_prompt

if [ $USER = $MYUSER ]; then
  PS1='${debian_chroot:+($debian_chroot)}${HOSTNAME}\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@${HOSTNAME}\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    if [ $USER = $MYUSER ]; then
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}${HOSTNAME}: \w\a\]$PS1"
    else
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@${HOSTNAME}: \w\a\]$PS1"
    fi
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias ls='ls --color=auto'
    # alias dir='dir --color=auto'
    # alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

export LESS=-eqR
export EDITOR=vi
export VISUAL=$EDITOR
umask 022

# Linux
if [ $(uname -s) == 'Linux' ]; then
:
fi # end Linux

# OS X
if [ $(uname -s) == 'Darwin' ]; then

# Set badge in iTerm2
function badge
{
  printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "$1" | base64)
}

fi # end OS X
