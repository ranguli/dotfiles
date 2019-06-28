#!/bin/sh

# Dotfiles - status.sh 
# Author: Joshua Murphy
# Github: https://github.com/ranguli/gentoo
# Statusbar script for dwm 

function eth_info {
    eth_nic=enp0s31f6
    eth_ip=$(ip addr | grep $eth_nic | grep inet | awk '{print $2}')
    if [[ $eth_ip ]]
    then
        echo "$eth_nic: $eth_ip"
    fi 
}

function wlan_info {
    wlan_nic=wlp61s0
    ssid=$(iw dev | grep ssid | sed 's/ssid//g' | tr -d ' \t')
    ssid_strength=$(cat /proc/net/wireless | awk 'NR==3 {print $3}' | tr -d '.')%
    wlan_ip=$(ip addr | grep $wlan_nic | grep inet | awk '{print $2}')
    if [[ $wlan_ip ]]
    then
        echo "$wlan_nic: $ssid $ssid_strength $wlan_ip"
    fi
}

while : 
do
    backlight=$(xbacklight -get | awk '{print int($1)}')
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    volume=$(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')
    
    xsetroot -name "$(date) | $(wlan_info) $(eth_info) | Backlight: $backlight% | Volume: $volume% | Battery: $battery%"
    sleep 0.5 
done

