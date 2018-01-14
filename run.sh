sudo dnf -y install libtool autoconf automake make pkgconfig unzip gcc gcc-c++ \
python-devel python3-devel kernel-devel cmake

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ./dotfiles && stow tmux
tmux source-file ~/.tmux.conf

# Neovim
cd ../neovim
https://github.com/neovim/neovim
git checkout tags/v0.2.2
make CMAKE_BUILD_TYPE=RelWithDebInfo
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/full/path/"
make install
nvim +PlugInstall +qa

cd ~/.vim/plugged/YouCompleteMe
./install.py --all
