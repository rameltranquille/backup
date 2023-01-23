#!/bin/bash

# python /home/ramel/.config/MacroPad/macropad.py /home/ramel/.config/MacroPad/pad.conf &
# picom --experimental-backend --vsync -b 
clipmenud &
redshift-gtk -l 40.7128:-74.0060 -t 6500:4000 & 
xidlehook --not-when-audio --timer 300 "betterlockscreen -l dimblur --display 1 --span" "dunstify 'Welcome Back'" --timer 10000 "systemctl suspend" "" --timer 3600 "systemctl poweroff --now" "" &
# python3 /usr/local/bin/focus-last.py &
