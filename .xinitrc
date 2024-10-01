xrdb ~/.Xresources
picom -b --no-fading-openclose
xset r rate 150 25
xrandr --output DP-1 --primary --mode 3840x2160 --output eDP-1 --off
feh --bg-fill ~/Git/dotfiles/wp.png
pulseaudio --start
dwmblocks &
exec dwm
