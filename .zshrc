if [[ $USER != "root" ]]; then
  . "$HOME/.cargo/env"
fi

# --------| PowerLevel 10k |----------- 
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# HISTSIZE=1000
# SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

# source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ---------| Oh My ZSH|--------
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/antigen/antigen.zsh

ZSH_THEME="agnoster"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Don't resolve symbolic links in z
_Z_NO_RESOLVE_SYMLINKS="true"

# Colorize settings
ZSH_COLORIZE_TOOL=chroma

# Nice ones: arduino friendly paraiso-dark solarized-dark solarized-dark256 vim
ZSH_COLORIZE_STYLE=vim

plugins=(
	git
	sudo
	npm
	yarn
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
alias mk="mkdir $1"
alias zathura="nohup zathura $1"
alias ls="exa --group-directories-first --icons"
alias cat="bat --style=plain --paging=never"
alias tree="exa -T --icons"
alias grep="grep --color=auto"

# ----| Directory |----
alias dow="cd $HOME/Descargas"
alias doc="cd $HOME/Documentos"
alias img="CD $HOME/Imágenes"
alias dev="cd $HOME/Workspaces/"
alias js="cd $HOME/Workspaces/JavaScript"

