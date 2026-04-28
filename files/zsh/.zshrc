export EDITOR='nvim'
export LANG='en_US.UTF-8'

# Ensure local binaries are in path
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# History configuration
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# -- 1. Oh My Zsh Path --
# Point this to where Oh My Zsh is actually installed
export ZSH="$HOME/.oh-my-zsh"

# -- 2. Theme & Plugins --
ZSH_THEME="robbyrussell" # You can change this to "agnoster" or "powerlevel10k"

# Add the plugins you installed via pacman (zoxide)
plugins=(
  git 
  zoxide 
  extract 
  sudo
  zsh-syntax-highlighting
  zsh-autosuggestions
  history-substring-search
  auto-notify
)

# -- 3. Initialize Oh My Zsh --
source $ZSH/oh-my-zsh.sh

# -- 4. Load Custom Modular Files --
# This loads everything you put inside your stowed .zsh folder
if [ -d "$HOME/.zsh" ]; then
  for config_file ($HOME/.zsh/*.zsh); do
    source "$config_file"
  done
fi

# -- 5. Tool Initializations --
eval "$(zoxide init zsh)"

# Fastfetch on startup (optional)
# fastfetch
