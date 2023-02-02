export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

eval "$(starship init zsh)"

if [[ $USER != "root" ]]; then
  export PATH=$HOME/bin:/usr/local/bin:$$HOME/.deno/bin:$HOME/.cargo/bin:$HOME/.spicetify:$PATH
  fpath=(~/.zsh $fpath)
  autoload -Uz compinit
  compinit -u

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#  [ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
fi

export SPACESHIP_CONFIG="$HOME/.dotfiles/path/to/spaceship.zsh"
ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

_Z_NO_RESOLVE_SYMLINKS="true"

ZSH_COLORIZE_TOOL=chroma
#
ZSH_COLORIZE_STYLE=vim
ZSH_DISABLE_COMPFIX=true
#
plugins=(
	colorize
	zsh-syntax-highlighting
	zsh-autosuggestions
  zsh-interactive-cd
)
#
source $ZSH/oh-my-zsh.sh

# -------------| Alias |----------------

# ----| Commands |----
alias vi="nvim $1"
alias v="nvim ."
alias mk="mkdir $1"
alias zathura="nohup zathura $1"
alias ls="exa --group-directories-first --icons"
alias la="exa --group-directories-first --icons -a"
alias cat="bat --style=plain --paging=never"
alias tree="exa -T --icons"
alias grep="grep --color=auto"
alias ng="npm init -y && git init"
alias nd="npm i -D $1"
alias ns="npm i $1"
alias t="tree $1"
alias paru="paru --bottomup $1"
alias sudo='sudo '

alias grep="grep --color=auto"
alias cat="bat --style=plain --paging=never"
alias vi="nvim $1"
alias v="nvim ."
alias mk="mkdir $1"
alias zathura="nohup zathura $1"
alias ls="exa --group-directories-first --icons"
alias la="exa --group-directories-first --icons -a"
alias ll="exa --group-directories-first --icons -l"
alias cat="bat --style=plain --paging=never"
alias tree="exa -T --icons"
alias grep="grep --color=auto"
alias t="tree $1"
alias paru="paru --skipreview --bottomup $1"

# Git

# Add
alias gaa="git add -A"

# Branch
alias gb="git branch"
alias gba="git branch --all --verbose"

# Checkout
alias gco="git checkout"
alias gbc="git checkout -b"

# Commit
alias gc="git commit --verbose"

# Status
alias gs="git status -sb"

# Fetch
alias gf="git fetch --all -p"

# Push
alias gps="git push"

# Pull
alias gpl="git pull"

# Merge (m)
alias gm='git merge'

# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias grs='git rebase --skip'

# Working Copy
alias gd="git diff --no-ext-diff --cached"

# Workspace
alias w="cd ~/.workspace"
alias wh="cd ~/.workspace/Houlak"

alias dot="git --git-dir ~/.dotfiles --work-tree ~"

[ -f "/home/iperez/.ghcup/env" ] && source "/home/iperez/.ghcup/env" # ghcup-env
