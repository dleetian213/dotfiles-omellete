#!/bin/bash

# 1. Update the system
# 2. makepkg the paru from AUR, for better safety

# 1. Update the system
sudo pacman -Syu --noconfirm git base-devel

# 2. makepkg the paru from AUR, for better safety
sudo pacman -S --needed paru
