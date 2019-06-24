#!/bin/sh

# Dotfiles - autostart.sh 
# Author: Joshua Murphy
# Github: https://github.com/ranguli/gentoo
# Autorun script when dwm starts 

xrdb -load ~/.Xresources

dunst&
./xcape.sh

function eth_info {
    eth_nic=enp0s31f6
    eth_ip=$(ip addr | grep $eth_nic | grep inet | awk '{print $2}')
    if [[ $eth_ip ]]
    then
        echo "$eth_nic: $eth_ip |"
    fi 
}

function wlan_info {
    wlan_nic=wlp61s0
    ssid=$(iw dev | grep ssid | sed 's/ssid//g' | tr -d ' \t')
    ssid_strength=$(cat /proc/net/wireless | awk 'NR==3 {print $3}' | tr -d '.')%
    wlan_ip=$(ip addr | grep $wlan_nic | grep inet | awk '{print $2}')
    if [[ $wlan_ip]]
    then
        echo "$wlan_nic: $ssid $ssid_strength $wlan_ip |"
    fi
}

function get_backlight {
    backlight=$(xbacklight -get | awk '{print int($1)}')
    echo "Backlight: $backlight% |"
}

while : 
do
    date="$(date) |"
    wlan=$(wlan_info)
    eth=$(eth_info)
    backlight=$(get_backlight)
    battery="Battery: $(cat /sys/class/power_supply/BAT0/capacity)% |"
    xsetroot -name  "$date $wlan $eth $battery $backlight" 
    sleep 0.5 
done

