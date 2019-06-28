#!/bin/sh

# Dotfiles - .xinitrc
# Author: Joshua Murphy
# Github: https://github.com/ranguli/dotfiles
# Configures what to do when X11 starts. 

exec ~/.dwm/status.sh &
exec dwm 
