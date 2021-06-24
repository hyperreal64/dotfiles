source "${HOME}/.zsh/antigen.zsh"

antigen use oh-my-zsh

antigen bundle git
antigen bundle extract
antigen bundle fzf
antigen bundle sudo
antigen bundle systemd
antigen bundle tmux
antigen bundle "MichaelAquilina/zsh-you-should-use"
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply

# Set keybinding for zsh-history-substring-search
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down

# Shell options
setopt appendhistory
setopt autocd
setopt cdablevars
setopt pushdignoredups
setopt autolist
setopt histignorealldups
setopt histsavenodups
setopt sharehistory
setopt longlistjobs

# Load completion from bash
autoload bashcompinit
bashcompinit

# Load goto shell utility
[[ -f "${HOME}/.zsh/goto.sh" ]] && source "${HOME}/.zsh/goto.sh"

# Aliases
[[ -s "${HOME}/.zsh/zaliases" ]] && source "${HOME}/.zsh/zaliases"

# Functions
[[ -s "${HOME}/.zsh/zfunctions" ]] && source "${HOME}/.zsh/zfunctions"

# Local stuffs
[[ -s "${HOME}/.zsh/zlocal" ]] && source "${HOME}/.zsh/zlocal"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
