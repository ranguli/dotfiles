#!/bin/bash

function script_cleanup () {
   rm -rf ./ctags
   rm -rf ./neovim
   rm -rf ./YouCompleteMe 
}

if [ "$1" == "--ubuntu" ]
then
   script_cleanup
   curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
   sudo apt-get install -y nodejs neovim python3-pip stow \
	   build-essential pkg-config autoconf cmake python-dev python3-dev
elif [ "$1" == "--fedora" ]
then	
   script_cleanup && sudo dnf -y install neovim libtool node npm autoconf \
	   automake make pkgconfig unzip gcc gcc-c++ python-devel \
	   python3-devel kernel-devel cmake ctags

elif [ "$1" == "--clean" ]
then	
   script_cleanup && exit
else
  echo Please supply the correct argument.	
  exit
fi

pip3 install --user neovim #This is required for certain support

git clone https://github.com/neovim/neovim
git clone https://github.com/universal-ctags/ctags 

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd ./neovim
git checkout tags/v0.2.2 #Or whichever version of Neovim you prefer.
make CMAKE_BUILD_TYPE=RelWithDebInfo
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/full/path/"
make -j 4 install
cd ~/dotfiles 
stow neovim
nvim +PlugInstall +qa

cd ./ctags && ./autogen.sh
./configure && make && sudo make install 

cd ~/.config/nvim/plugged/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --js-completer

