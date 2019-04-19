#!/bin/sh

# Dotfiles - .xinitrc
# Author: Joshua Murphy
# Github: https://github.com/ranguli/dotfiles
# Configures what to do when X11 starts. 

exec i3

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
