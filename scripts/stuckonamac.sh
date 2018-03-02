#!/bin/bash

#   ███████╗████████╗██╗   ██╗ ██████╗██╗  ██╗     ██████╗ ███╗   ██╗     █████╗     ███╗   ███╗ █████╗  ██████╗   
#   ██╔════╝╚══██╔══╝██║   ██║██╔════╝██║ ██╔╝    ██╔═══██╗████╗  ██║    ██╔══██╗    ████╗ ████║██╔══██╗██╔════╝   
#   ███████╗   ██║   ██║   ██║██║     █████╔╝     ██║   ██║██╔██╗ ██║    ███████║    ██╔████╔██║███████║██║        
#   ╚════██║   ██║   ██║   ██║██║     ██╔═██╗     ██║   ██║██║╚██╗██║    ██╔══██║    ██║╚██╔╝██║██╔══██║██║        
#   ███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗    ╚██████╔╝██║ ╚████║    ██║  ██║    ██║ ╚═╝ ██║██║  ██║╚██████╗▄█╗
#   ╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝     ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝
#
#   ██████╗ ██╗     ███████╗ █████╗ ███████╗███████╗    ███████╗███████╗███╗   ██╗██████╗     ██╗  ██╗███████╗██╗     ██████╗ 
#   ██╔══██╗██║     ██╔════╝██╔══██╗██╔════╝██╔════╝    ██╔════╝██╔════╝████╗  ██║██╔══██╗    ██║  ██║██╔════╝██║     ██╔══██╗
#   ██████╔╝██║     █████╗  ███████║███████╗█████╗      ███████╗█████╗  ██╔██╗ ██║██║  ██║    ███████║█████╗  ██║     ██████╔╝
#   ██╔═══╝ ██║     ██╔══╝  ██╔══██║╚════██║██╔══╝      ╚════██║██╔══╝  ██║╚██╗██║██║  ██║    ██╔══██║██╔══╝  ██║     ██╔═══╝ 
#   ██║     ███████╗███████╗██║  ██║███████║███████╗    ███████║███████╗██║ ╚████║██████╔╝    ██║  ██║███████╗███████╗██║     
#   ╚═╝     ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚══════╝╚══════╝╚═╝  ╚═══╝╚═════╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     
#
#   Author: ranguli
#   GitHub: https://www.github.com/ranguli/scripts
#   2017

# If you're like me and run Linux on a MacBook, on the odd occasion you'll find yourself back in OS X trying
# to do something just wishing you were back on the dark side. This script is designed to make your time on 
# a different OS as easy as possible

# Install Homebrew, the missing package manager for OS X

vundle="~/.vim/bundle/Vundle.vim"

declare -a pkg=(
    "stow"
    "git"
    "wget"
    "zsh"
    "zsh-completions"
    "vim"
)

for i in "${arr[@]}"
do
    echo "$i"
done



if ! type "brew" > /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update && brew upgrade
fi

# Install some basics through brew (most of which are newer versions of their natively packaged macOS counterparts.
if ! brew ls --versions "${arr[@]}" > /dev/null; then
    brew install "${arr[@]}"
fi


#Install Vundle
if [ -e $vundle ]
then
    echo "Vundle already installed."
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install ohmyzsh, a community framework for managing zsh configurations
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Clone the dotfiles repo, stow vim and zsh, then remove the repo.
git clone https://github.com/ranguli/dotfiles/vim 
cd ./dotfiles && stow vim && stow zsh && rm -rf ../dotfiles/

# Housekeeping, such as updating python, etc.
pip install --upgrade pip setuptools

