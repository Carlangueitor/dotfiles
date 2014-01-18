# ZSH min config.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(git fabric pip vagrant virtualenvwrapper)

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"


source $ZSH/oh-my-zsh.sh
source /usr/local/bin/virtualenvwrapper.sh

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export WORKON_HOME=$HOME/.virtualenvs


# Super Power alisases.
#######################

# Git 
alias ga='git add'
alias gl='git log --oneline --color'
alias gis='git status --short'
alias gch='git checkout'
alias gpo='git push origin'
