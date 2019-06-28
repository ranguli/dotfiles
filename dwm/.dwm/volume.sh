amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g'
