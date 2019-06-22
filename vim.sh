# Dotfiles - vim.sh
# Author: Joshua Murphy
# Date: March 1st, 2018
# Licensed under the GNU GPL v3.
# https://github.com/ranguli/dotfiles

# Old build script with my compiler flags for the Vim editor.
# This is obsolote now because I switched to neovim

sudo apt-get remove vim vim-runtime vim-gtk vim-gtk3

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git checkinstall

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk3\
            --enable-cscope \
            --prefix=/usr/local
make -j4 VIMRUNTIMEDIR=/usr/local/share/vim/vim80
sudo checkinstall
sudo make install       

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

#Install Vundle before first run
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Launch Vundle plugin install on first run
vim +PluginInstall +qall
