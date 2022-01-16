#!/usr/bin/env bash

# Dotfiles - status.sh 
# Author: Joshua Murphy
# Github: https://github.com/ranguli/gentoo
# Statusbar script for dwm 

OS=$(uname -s)

function calc { awk "BEGIN {print "$*"}"; }

function get_battery {
    if [[ "$OS" = "OpenBSD" ]]; then
	    battery=$(apm | awk 'NR==1 {print $4}')
    else
    	    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    fi

    echo $battery
}

function get_volume {
    if [[ "$OS" = "OpenBSD" ]]; then
	    volume=$(bc -l <<< "scale=2; $(mixerctl | grep outputs.master= | sed 's/^.*,//') / 255 * 100")
    else
	    volume=$(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')
    fi

    echo $volume
}

function eth_info {
    if [[ "$OS" = "OpenBSD" ]]; then
        eth_nic=em0
	eth_ip=$(ifconfig | grep $eth_nic -A7 | grep inet | awk 'NR==1 {print $2}')
    else
        eth_nic=enp0s31f6
        eth_ip=$($ip_command | grep $eth_nic | grep inet | awk '{print $2}')
    fi
    
    status=$(ifconfig | grep $eth_nic -A7 | grep status: | sed 's/^.*: //' | tr '\t' ' ')

    if [[ $eth_ip ]] && [[ "$status" = "active" ]]; then
        echo "$eth_nic: $eth_ip"
    else
	echo ""

    fi 
}

function wlan_info {
    if [[ "$OS" = "OpenBSD" ]]; then
        wlan_nic=athn0
	ssid=$(ifconfig | grep $wlan_nic -A7 | grep ieee80211 | awk 'NR==1 {print $3}')
        wlan_ip=$(ifconfig | grep $wlan_nic -A7 | grep inet | awk '{print $2}')
	dbm=$(ifconfig | grep $wlan_nic -A6 | grep ieee20111 | awk '{print $8}' | cut -c1-3)

	if (( "$dbm" -ge "-50" )); then
		ssid_strength=100%
	elif (( "$dbm" -ge "-51" )) && (( "$dbm" <= "-55" )); then
		ssid_strength=90%
	elif (( "-56" -ge "$dbm" -ge "-62" )); then
		ssid_strength=80%
	elif (( "-63" -ge "$dbm" -ge "-65" )); then
		ssid_strength=75%
	elif (( "-66" -ge "$dbm" -ge "-68" )); then
		ssid_strength=70%
	elif (( "-69" -ge "$dbm" -ge "-74" )); then
		ssid_strength=60%
	elif (( "-63" -ge "$dbm" -ge "-65" )); then
		ssid_strength=75%
	else
		ssid_strength=""
	fi
    else 
	wlan_nic=wlp61s0
        ssid=$(dev | grep ssid | sed 's/ssid//g' | tr -d ' \t')
        ssid_strength=$(cat /proc/net/wireless | awk 'NR==3 {print $3}' | tr -d '.')%
        wlan_ip=$(ip addr | grep $wlan_nic | grep inet | awk '{print $2}')
    fi
    
    status=$(ifconfig | grep $wlan_nic -A7 | grep status: | sed 's/^.*: //' | tr '\t' ' ')

    if [[ $wlan_ip ]] && [[ "$status" = "active" ]]; then
        echo "$wlan_nic: $ssid $ssid_strength $wlan_ip"
    fi
}

while : 
do
    #backlight=$(xbacklight -get | awk '{print int($1)}')
    
    xsetroot -name "$(date) | $(wlan_info) $(eth_info) | Backlight: $backlight% | Volume: $(get_volume)% | Battery: $(get_battery)"
    sleep 0.5 
done

