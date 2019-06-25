#!/bin/bash

while getopts m:v: option
do
case "${option}" in
    m) 
      MODE=${OPTARG}
      ;;
    v)
      VALUE=${OPTARG}
      ;;
esac
done

echo $MODE
echo $VALUE

if [[ $MODE == "volume" ]]
then
    if [[ $VALUE == "inc" ]]
    then
        amixer -q sset Master 10%+
        dunstify Volume: $(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')
    elif [[ $VALUE == 'dec' ]]
    then
        amixer -q sset Master 10%-
        dunstify Volume: $(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')
    elif [[ $VALUE == 'mute' ]]
    then
        amixer sset Master toggle
        dunstify Mute toggled 
    elif [[ $VALUE = 'micmute' ]]
    then
        amixer set Capture toggle
	dunstify Mic toggled 
    fi
fi
