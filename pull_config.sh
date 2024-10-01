#!/bin/bash

# COPY CONFIG FILES

# NEOVIM
yes | cp -rf ~/.config/nvim ~/Git/dotfiles

# X11
yes | cp -rf ~/.xinitrc ~/Git/dotfiles
yes | cp -rf ~/.Xresources ~/Git/dotfiles

# ALACRITTY
yes | cp -rf ~/.config/alacritty ~/Git/dotfiles/
