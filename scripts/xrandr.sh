#!/usr/bin/env bash

# Dotfiles - xrandr.sh
# Author: Joshua Murphy
# Github: https://github.com/ranguli/gentoo
# Sets correct display settings

xrandr --output HDMI-A-0 --rotate inverted
xrandr --output HDMI-A-0 --pos 0x-1080
xrandr --output DisplayPort-1 --rotate right --pos 2580x0
