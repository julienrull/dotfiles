xrdb ~/.Xresources
setxkbmap -model pc105 -layout fr -option altwin:swap_lalt_lwin
picom -b --no-fading-openclose
xset r rate 200 25
xrandr --output DP-1 --primary --mode 3840x2160 --output eDP-1 --off
feh --bg-fill ~/Git/dotfiles/wp.png
dwmblocks &
exec dwm
