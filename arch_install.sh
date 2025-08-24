#!/bin/sh

# Update system 

sudo pacman -Syyu

# Install system dependencies
sudo pacman -Sy base-devel dbus xorg xorg-xinit xdg-desktop-portal xdg-desktop-portal-gtk pipewire pipewire-pulse pavucontrol wireplumber bluez blueman picom dunst rofi neovim zsh fastfetch wezterm openrgb yazi feh curl wget maim satty xclip xcolor

# Setup shell
# TODO: disable interactif
chsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/m3tozz/FastCat.git && cd FastCat && bash ./fastcat.sh --shell

# Enable and start servicies
sudo systemctl enable --now dbus.service bluetooth.service  
systemctl enable --user --now pipewire.service wireplumber.service pipewire-pulse.service

# Make a backup
BACKUP_FOLDER="$HOME/.dotfiles_backup"
sudo rm -rf $BACKUP_FOLDER
mkdir -p $BACKUP_FOLDER/config

mv      $HOME/startdwm.sh     $BACKUP_FOLDER/config/ || true  
mv      $HOME/.zshrc          $BACKUP_FOLDER/config/ || true
mv      $HOME/.zprofile       $BACKUP_FOLDER/config/ || true
mv      $HOME/.xinitrc        $BACKUP_FOLDER/config/ || true
mv      $HOME/.Xresources     $BACKUP_FOLDER/config/ || true
mv      $HOME/.wezterm.lua    $BACKUP_FOLDER/config/ || true

mv    $HOME/.config/dwm       $BACKUP_FOLDER/        || true  
mv    $HOME/.config/slock     $BACKUP_FOLDER/        || true
mv    $HOME/.config/slstatus  $BACKUP_FOLDER/        || true

mv    $HOME/.config/nvim      $BACKUP_FOLDER/config/ || true
mv    $HOME/.config/rofi      $BACKUP_FOLDER/config/ || true
mv    $HOME/.config/dunst     $BACKUP_FOLDER/config/ || true
mv    $HOME/.config/yazi      $BACKUP_FOLDER/config/ || true

# Fetch dotfiles

TMP_FOLDER="$HOME/.dotfiles_tmp"

mkdir -p $TMP_FOLDER
git clone ... $TMP_FOLDER

# Install dotfiles
mkdir -p $HOME/.config

cp      $TMP_FOLDER/config/startdwm.sh  $HOME/
cp      $TMP_FOLDER/config/.zshrc       $HOME/
cp      $TMP_FOLDER/config/.zprofile    $HOME/
cp      $TMP_FOLDER/config/.xinitrc     $HOME/
cp      $TMP_FOLDER/config/.Xresources  $HOME/
cp      $TMP_FOLDER/config/.wezterm.lua $HOME/

cp -r   $TMP_FOLDER/dwm                 $HOME/.config/
cp -r   $TMP_FOLDER/slock               $HOME/.config/
cp -r   $TMP_FOLDER/slstatus            $HOME/.config/

cp -r   $TMP_FOLDER/config/nvim         $HOME/.config/
cp -r   $TMP_FOLDER/config/rofi         $HOME/.config/
cp -r   $TMP_FOLDER/config/dunst        $HOME/.config/
cp -r   $TMP_FOLDER/config/yazi         $HOME/.config/

# Build and install suckless tools
  
pushd $HOME/.config/dwm
sudo make install
popd
pushd $HOME/.config/slock
sudo make install
popd
pushd $HOME/.config/slstatus
sudo make install
popd

sudo rm -rf $TMP_FOLDER
