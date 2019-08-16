#!/bin/zsh

autoload -U compinit
compinit

autoload -U promptinit
promptinit
prompt adam1

HISTSIZE=4000
HISTFILE="$HOME/.zhistory"
SAVEHIST=$HISTSIZE

setopt correctall
setopt autocd
setopt inc_append_history
setopt share_history

# export EDITOR=vim
# export VISUAL=vim

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/charly/pr/loanypotless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/charly/pr/loanypotless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/charly/pr/loanypotless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/charly/pr/loanypotless/node_modules/tabtab/.completions/sls.zsh