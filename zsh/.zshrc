#!/usr/bin/env zsh
#
# Main zshrc
#
# Editor:
#   Jeffrey Serio <hyperreal64@gmail.com>
#

export ZSH=$HOME/.oh-my-zsh

plugins=(
  extract
  fzf
  git
  history-substring-search
  sudo
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
)

# Toolbox-specific plugins
tb_plugins=(
  dnf
)

# Host-specific plugins
host_plugins=(
  firewalld
  systemd
  tmux
  tmuxinator
)

# If OCI or WSL, set plugins, themes, vars accordingly
if (( ${+container} )); then
    plugins+=($tb_plugins)
    ZSH_THEME="spaceship-prompt/spaceship"
    TB_NAME=$(source /run/.containerenv && echo $name)
elif (( ${+WSLENV} )); then
    plugins+=(dnf tmux ubuntu)
    ZSH_THEME="spaceship-prompt/spaceship"
    export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
else
    plugins+=($host_plugins)
    ZSH_THEME="linuxonly2"
fi

source $ZSH/oh-my-zsh.sh

# Set keybinding for history substring search
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down

# Shell options
setopt appendhistory
setopt incappendhistory
setopt auto_cd

# Load completion for goto
autoload bashcompinit
bashcompinit

# Load goto shell utility
[[ -f /usr/local/share/goto.sh ]] && source /usr/local/share/goto.sh

# Aliases
[[ -s "${HOME}/.zsh/zaliases" ]] && source "${HOME}/.zsh/zaliases"

# Functions
[[ -s "${HOME}/.zsh/zfunctions" ]] && source "${HOME}/.zsh/zfunctions"

# Local stuffs
[[ -s "${HOME}/.zsh/zlocal" ]] && source "${HOME}/.zsh/zlocal"
