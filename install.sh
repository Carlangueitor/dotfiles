#!/bin/bash
# Installs and bootstraps selected configs.
#
# Usage:
#   install  
#   install vim
#
# Disponible configs:
#   vim


# Create .vimrc symlink and create necesary dirs.
function setup_vim {
    echo "Setup Vim Config..."
    git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
    ln -s $PWD/vim ~/.vim
    ln -s $PWD/vimrc ~/.vimrc
    vim +BundleInstall +qall
}


function main {
    hash figlet 2>/dev/null  # Checks if figlet is installed.
    has_figlet=$?
    if [ $has_figlet == 0 ]; then
        figlet dotfiles
    else
        echo "DOTFILES SETUP"
    fi
    
    for param in $@
    do
        if [ $param == "vim" ]; then
            setup_vim
        fi
    done
}

main $*
