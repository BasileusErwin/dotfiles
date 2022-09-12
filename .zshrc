#export LANG="es_UY.UTF-8"

eval "$(starship init zsh)"

if [[ $USER != "root" ]]; then
  # Deno
  export DENO_INSTALL="/home/kaisererwin/.deno"
  # # Rust
  # source "$HOME/.cargo/env"

  export PATH=$HOME/bin:/usr/local/bin:$DENO_INSTALL/bin:$PATH
  fpath=(~/.zsh $fpath)
  autoload -Uz compinit
  compinit -u

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  [ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
fi

# export ZSH="$HOME/.oh-my-zsh"
#
# ZSH_THEME="agnoster"
#
# source $ZSH/oh-my-zsh.sh
#
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Don't resolve symbolic links in z
_Z_NO_RESOLVE_SYMLINKS="true"

# Colorize settings
ZSH_COLORIZE_TOOL=chroma

# Nice ones: arduino friendly paraiso-dark solarized-dark solarized-dark256 vim
ZSH_COLORIZE_STYLE=vim
ZSH_DISABLE_COMPFIX=true
#
plugins=(
	git
	sudo
	npm
	yarn
	deno
	colorize
	github
	zsh-syntax-highlighting
	zsh-autosuggestions
	git-prompt
)
#
# # -------------| Plugins |--------------
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-sudo/sudo.plugin.zsh

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
alias w="cd ~/Workspace"
alias wh="cd ~/Workspace/Houlak"

alias dot="git --git-dir ~/.dotfiles --work-tree ~"
