export LANG="es_UY.UTF-8"

eval "$(starship init zsh)"

if [[ $USER != "root" ]]; then
  # Deno
  export DENO_INSTALL="/home/kaisererwin/.deno"
  # Rust
  source "$HOME/.cargo/env"

  export PATH=$HOME/bin:/usr/local/bin:$DENO_INSTALL/bin:$PATH
  fpath=(~/.zsh $fpath)
  autoload -Uz compinit
  compinit -u

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  [ -f "/home/kaisererwin/.ghcup/env" ] && source "/home/kaisererwin/.ghcup/env" # ghcup-env
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
#
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
