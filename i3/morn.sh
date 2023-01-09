#!/bin/bash

# python /home/ramel/.config/MacroPad/macropad.py /home/ramel/.config/MacroPad/pad.conf &
# picom --experimental-backend --vsync -b 
clipmenud &
redshift-gtk -l 40.7128:-74.0060 -t 6500:4000 & 
xidlehook --not-when-audio --timer 180 "xrandr --output DVI-D-0 --brightness 0.5 --output HDMI-0 --brightness 0.5" "xrandr --output DVI-D-0 --brightness 1.0 --output HDMI-0 --brightness 1.0" --timer 300 "betterlockscreen -l dimblur --display 1 --span" "dunstify 'Welcome Back'" --timer 10000 "systemctl suspend" "" &
# python3 /usr/local/bin/focus-last.py &
