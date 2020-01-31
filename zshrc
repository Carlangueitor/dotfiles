#!/bin/zsh

autoload -U compinit
compinit

autoload -U promptinit
promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  pyenv         # Pyenv section
  kubectl   	# Kubectl section
  line_sep      # Line break
  exec_time     # Execution time
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false

HISTSIZE=10000
HISTFILE="$HOME/.zhistory"
SAVEHIST=$HISTSIZE

setopt correctall
setopt autocd
setopt inc_append_history
setopt share_history

# export EDITOR=vim
# export VISUAL=vim

# kubectl completion
source <(kubectl completion zsh)

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
