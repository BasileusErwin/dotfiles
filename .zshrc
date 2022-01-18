export LANG="es_UY.UTF-8"

if [[ $USER != "root" ]]; then
	# Rust
	. "$HOME/.cargo/env"
	# Deno
  export DENO_INSTALL="$HOME/.deno"

  export PATH=$HOME/bin:/usr/local/bin:$DENO_INSTALL/bin:$PATH
	fpath=(~/.zsh $fpath)
	autoload -Uz compinit
	compinit -u
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Don't resolve symbolic links in z
_Z_NO_RESOLVE_SYMLINKS="true"

# Colorize settings
ZSH_COLORIZE_TOOL=chroma

# Nice ones: arduino friendly paraiso-dark solarized-dark solarized-dark256 vim
ZSH_COLORIZE_STYLE=vim
ZSH_DISABLE_COMPFIX=true

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

# -------------| Plugins |--------------
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
alias t="tree $1"
alias paru="paru --bottomup $1"
