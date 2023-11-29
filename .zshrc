export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

zstyle ':omz:update' frequency 60 

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

HIST_STAMPS="dd.mm.yyyy"

plugins=(
   git
   zsh-autosuggestions
   zsh-syntax-highlighting
   extract
   ) 

source $ZSH/oh-my-zsh.sh
