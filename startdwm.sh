#!/bin/sh

xrdb ~/.Xresources
setxkbmap -model pc105 -layout fr -option altwin:swap_lalt_lwin
picom -b --no-fading-openclose
xset r rate 200 25
xrandr --output DP-2 --primary --mode 3840x2160 --output eDP-1 --off
feh --bg-fill ~/Git/dotfiles/wp.png
dwmblocks &
pipewire &

while true; do
    dbus-run-session dwm 2> ~/.dwm.log
done

