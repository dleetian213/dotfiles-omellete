#!/bin/bash

# 1. Install stow
# 2.1. Install hyprland
# 2.2. Install alacritty
# 2.3. Install XDG Desktop Portal. The portal is crucial for handling desktop functionalities such as file dialogs and screensharing.
# 2.4. Install Polkit KDE Agent. Polkit manages system-wide privileges, install KDE for better compatibility.
# 2.5. Install QT  Wayland Support. These are necessary QT applicatiosn to function in wayland.
# 3. Install hyprpaper
# 4. Install hypridle
# 5. Install hyprlock
# 6. Install rofi
# 7. Install waybar
# 8. Install dunst
# 9. Install ly and enable ly
# 10. Setup for Clipboard
# 11. Stow

# Always echo the title with style, and then the description, add color for description. Blue for title, white blue for subtitle
# Checklist: Add the waybar, rofi, dunst in the hypr config
# Checklist: Add exec-once=/usr/lib/polkit-kde-authentication-agent-1 (no whitespace between = and /)
# Checklist: Add exec-once=/usr/bin/dunst
# Checklist: Copy paste function

# 1. Install stow
sudo pacman -S --needed stow

# 2.1. Install Hyprland
sudo pacman -S --needed hyprland

# 2.2. Install alacritty
sudo pacman -S --needed alacritty

# 2.3. Install XDG Desktop Portal
sudo pacman -S --needed xdg-desktop-portal-hyprland

# 2.4. Install Polkit
sudo pacman -S --needed polkit-kde-agent

# 2.5. Install QT Wayland Support
sudo pacman -S --needed qt5-wayland qt6-wayland

# 3. Install Hyprpaper
sudo pacman -S --needed hyprpaper

# 4. Install Hypridle
sudo pacman -S --needed hypridle

# 5. Install Hyprlock
sudo pacman -S --needed hyprlock

# 6. Install Rofi
sudo pacman -S --needed rofi

# 7. Install Waybar
sudo pacman -S --needed waybar

# 8. Install Dunst
sudo pacman -S --needed dunst

# 9. Install ly and enable ly
sudo pacman -S --needed ly
sudo systemctl enable ly@tty1.service
sudo systemctl start ly@tty1.service

# 10. Setup for Clipboard
sudo pacman -S --needed wl-clipboard cliphist
yay -S --needed wl-copy slurp grim
mkdir $HOME/Pictures

# Stow hyprland, hyprpaper, hypridle
cd $HOME/dotfiles/files
[ -e "$HOME/.config/hypr" ] && rm -rf "$HOME/.config/hypr"
stow -t ~ hypr
# [ -e "$HOME/.config/hypr" ] && mv "$HOME/.config/hypr" "$HOME/.config/hypr-backup"

# Stow waybar
cd $HOME/dotfiles/files
[ -e "$HOME/.config/waybar" ] && rm -rf "$HOME/.config/waybar"
stow -t ~ waybar

# Stow rofi
cd $HOME/dotfiles/files
[ -e "$HOME/.config/rofi" ] && rm -rf "$HOME/.config/rofi"
stow -t ~ rofi

# Stow dunst
