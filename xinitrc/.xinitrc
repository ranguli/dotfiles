#!/bin/sh

~/.scripts/xcape.sh
xrdb ~/.Xresources
exec i3
exec compton --config ~/.config/compton.conf
exec feh --bg-scale ~/dotfiles/wallpapers/jon-flobrant-49795.jpg

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


