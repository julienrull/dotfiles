#!/bin/sh

for item in  base-devel dbus xorg xorg-xinit xdg-desktop-portal xdg-desktop-portal-gtk pipewire pipewire-pulse pavucontrol wireplumber bluez blueman picom dunst rofi neovim zsh fastfetch wezterm openrgb yazi feh; do
  if pacman -Si "$item" &>/dev/null; then
    echo "✓ $item (PACKAGE)"
  elif pacman -Sg "$item" &>/dev/null; then
    echo "✓ $item (GROUP)"
    pacman -Sgq "$item" | sed 's/^/   • /'
  else
    echo "✗ $item (NOT FOUND)"
  fi
done
