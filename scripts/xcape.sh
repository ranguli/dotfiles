# Thanks to this brilliant article, we can map Caps Lock to generate Escape 
# When pressed on it's own, but if it's held in a combination with another 
# key, it's Control. 

# http://tiborsimko.org/capslock-escape-control.html

setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
