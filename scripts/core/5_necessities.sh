#!/bin/bash

# 1. Install brave-bin, firefox
# 2. Install nautilus, dolphin, fd
# 3. Install calibre (with DRM plugin), foliate
# 4. Install obsidian
# 5. Installing mpv, yt-x, ani-cli


# 1. Install brave-bin, firefox
sudo pacman -S --needed firefox
yay -S --needed brave-bin

# 2. Install nautilus, dolphin, fd
sudo pacman -S --needed nautilus dolphin fd

# 3. Install calibre (with DRM plugin), foliate
sudo pacman -S --needed calibre foliate

# 4. Install obsidian
sudo pacman -S --needed obsidian

# 5. Installing mpv, yt-x, ani-cli
sudo pacman -S --needed mpv
yay -S --needed yt-x ani-cli
