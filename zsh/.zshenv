#!/usr/bin/env zsh
#
# Defines environment variables, pre-zshrc
#
# Editor:
#   Jeffrey Serio <hyperreal64@gmail.com>
#

# Ensure that a non-login, non-interactive shell has defined environment
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export PAGER="less -X"
export EDITOR="nvim"
export HISTSIZE=5000
export HISTDUP=erase

if (( ${+TMUX} )); then
    export TERM="screen-256color"
else
    export TERM="xterm-256color"
fi

export SOURCE_DIR="${HOME}/source"
export DOTFILES="${HOME}/dotfiles"
export FZF_BASE="${HOME}/.fzf"
export FZF_COMPLETION_TRIGGER="~~"

if [ -e /home/jas/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jas/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
