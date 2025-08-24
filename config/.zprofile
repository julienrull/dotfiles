if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && [ "${XDG_VTNR:-0}" = "1" ]; then
  exec startx
fi
