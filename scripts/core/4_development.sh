#!/bin/bash

# 1. Install stow
# 2. Install alacritty ghostty
# 3.1 Install neovim
# 3.2 Install fonts for neovim
# 4. Install tmux
# 5. Install visual-studio-code-bin
# 6. Install python3, java, c++, nodejs
# 7. Install docker
# 9. Install curl, httpie
# 10. Stow
# 11. Docker setup

# 1. Install stow
sudo pacman -S --needed stow

# 2. Install alacritty
sudo pacman -S --needed alacritty ghostty

# 3.1 Install neovim
sudo pacman -S --needed neovim

# 3.2 Install fonts for neovim
sudo pacman -S --needed ttf-iosevka-nerd

# 4. Install tmux
sudo pacman -S --needed tmux

# 5. Install visual-studio-code-bin
yay -S --needed visual-studio-code-bin

# 6. Install python3, java, c++, nodejs
sudo pacman -S --needed python jdk-openjdk gcc nodejs npm

# 7. Install docker
sudo pacman -S --needed docker

# 9. Install curl, httpie
sudo pacman -S --needed curl httpie

# stow alacritty
# stow neovim
cd $HOME/dotfiles/files
[ -e "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
stow -t ~ nvim

# stow tmux
# stow fastfetch
# stow zsh and oh-my-zsh

# Setup Docker, create groups and pull images
sudo systemctl start docker
sudo docker login
sudo docker pull postgresql:alpine
sudo usermod -aG docker $USER
newgrp docker
sudo docker run hello-world
