#!/bin/sh

~/.scripts/xcape.sh
xrdb ~/.Xresources
exec i3

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


