sudo apt-get install rxvt-unicode-256color zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

sudo chsh -s /usr/bin/zsh
stow vim
stow tmux
stow x11
