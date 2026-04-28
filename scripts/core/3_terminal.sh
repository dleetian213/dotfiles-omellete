#!/bin/bash

# 1. Install stow
# 2. Install alacritty and ghostty
# 3.1 Install neovim
# 3.2 Install fonts for neovim
# 4. Install tmux
# 5. Install brightnessctl
# 6. Install btop
# 7. Install fastfetch
# 8. Install zsh
# 9. Install ripgrep fd tldr zoxide lf
# 10 Stow

# Find a plugin in TMUX that saves state, so it's faster to run
# eval "$(zoxide init zsh)"

# 1. Install stow
sudo pacman -S --needed stow

# 2. Install alacritty and ghostty
sudo pacman -S --needed alacritty ghostty

# 3.1 Install neovim
sudo pacman -S --needed neovim

# 3.1 Install fonts for neovim
sudo pacman -S --needed ttf-iosevka-nerd

# 4. Install tmux
sudo pacman -S --needed tmux

# 5. Install brightnessctl
sudo pacman -S --needed brightnessctl

# 6. Install btop
sudo pacman -S --needed btop

# 7. Install fastfetch
sudo pacman -S --needed fastfetch

# 8. Install zsh
sudo pacman -S --needed zsh

# 9. Install ripgrep fd tldr zoxide lf
sudo pacman -S --needed ripgrep fd tldr zoxide lf

# stow alacritty
# stow neovim
cd $HOME/dotfiles/files
[ -e "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
stow -t ~ nvim

# stow tmux
cd $HOME/dotfiles/files
[ -e "$HOME/.config/tmux" ] && rm -rf "$HOME/.config/tmux"
stow -t ~ tmux

# stow fastfetch
cd $HOME/dotfiles/files
[ -e "$HOME/.config/fastfetch" ] && rm -rf "$HOME/.config/fastfetch"
stow -t ~ fastfetch

# stow zsh and oh-my-zsh
cd $HOME/dotfiles/files
[ -e "$HOME/.zsh" ] && rm -rf "$HOME/.zsh"
[ -e "$HOME/.zshrc" ] && rm "$HOME/.zshrc"
stow -t ~ zsh

if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Switching default shell to Zsh..."
  sudo chsh -s /usr/bin/zsh "$USER"
fi
