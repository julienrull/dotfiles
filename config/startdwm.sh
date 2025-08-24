#!/bin/sh
xrdb ~/.Xresources
setxkbmap -model pc105 -layout fr -option altwin:swap_lalt_lwin
xset r rate 200 25
xrandr --output DP-2 --primary --mode 3840x2160 --output eDP-1 --off
feh --bg-fill ~/Git/dotfiles/wp.png
slstatus&
picom -b --fade-in-step=1 --fade-out-step=1
while true; do
    dbus-run-session dwm 2> ~/.dwm.log
done
