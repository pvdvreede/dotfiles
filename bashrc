#! /bin/bash

function __prompt_command() {
  local EXIT="$?"
  if [ $EXIT != 0 ]; then
    EXIT="$red$EXIT$reset"
  else
    EXIT="$green$EXIT$reset"
  fi

  PROMPT_DIRTRIM=2
  PS1="\n[ $blue\u$reset@$gray\h $reset]-[ $white\w$reset ]-[ $EXIT ]$reset\n$ "
}

export PROMPT_COMMAND="__prompt_command;$PROMPT_COMMAND"

# colors
blue="\[\033[1;34m\]"
purple="\[\033[1;35m\]"
brown="\[\033[1;33m\]"
cyan="\[\033[1;36m\]"
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
reset="\[\033[0m\]"
gray="\[\e[1;30m\]"
white="\[\e[1;37m\]"

# history setup
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

# aliases
alias fig="docker-compose"

alias gst="git status"
alias gco="git checkout"
alias gb="git branch"
alias gc="git commit -v"
alias ga="git add"
alias gd="git diff"
alias gdc="git diff --cached"
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gpr="git pull --rebase"

alias ll="ls -lah"
alias ..="cd .."
alias ...="cd ../../"

# env vars
export EDITOR=vim
export TERM=xterm-256color

if [ -e "$HOME/.custom_env" ]; then
  source $HOME/.custom_env
fi

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi
