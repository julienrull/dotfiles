#!/bin/bash

# COPY CONFIG FILES

# NEOVIM
yes | cp -rf ~/Git/dotfiles/nvim ~/.config/ 

# X11
yes | cp -rf ~/Git/dotfiles/.xinitrc ~/
yes | cp -rf ~/Git/dotfiles/startdwm.sh ~/
yes | cp -rf ~/Git/dotfiles/.Xresources ~/ 

# ALACRITTY
yes | cp -rf ~/Git/dotfiles/alacritty ~/.config/
