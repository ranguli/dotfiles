#!/bin/sh

# Dotfiles - .xinitrc
# Author: Joshua Murphy
# Github: https://github.com/ranguli/dotfiles
# Configures what to do when X11 starts. 

~/dotfiles/scripts/xcape.sh
~/dotfiles/scripts/screen_layout_office.sh
xrdb ~/.Xresources

exec i3
exec compton --config ~/.config/compton.conf
exec feh --bg-scale ~/dotfiles/wallpapers/jon-flobrant-49795.jpg
exec unclutter 

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


