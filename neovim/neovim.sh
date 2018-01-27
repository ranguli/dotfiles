sudo dnf -y install neovim libtool node npm autoconf automake make pkgconfig unzip gcc gcc-c++ \
python-devel python3-devel kernel-devel cmake ctags

pip3 install --user neovim #This is required for certain support

cd ~/ && git clone https://github.com/neovim/neovim

git checkout tags/v0.2.2 #Or whichever version of Neovim you prefer.
make CMAKE_BUILD_TYPE=RelWithDebInfo
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/full/path/"
make -j 4 install
cd ~/dotfiles && stow neovim
nvim +PlugInstall +qa

cd ~/ && git clone https://github.com/universal-ctags/ctags 
cd ./ctags && ./autogen.sh
./configure && make && sudo make install 

cd ~/.config/nvim/plugged/YouCompleteMe
./install.py --clang-completer --js-completer
