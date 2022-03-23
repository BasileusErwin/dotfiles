function commit
  git commit -m $argv
end

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

set -x DENO_INSTALL /home/kaisererwin/.deno
set -x PATH $DENO_INSTALL/bin:$PATH

set fish_greeting ""

# Aliases
alias sudo 'sudo '

alias grep "grep --color=auto"
alias cat "bat --style=plain --paging=never"
alias vi "nvim $1"
alias v "nvim ."
alias mk "mkdir $1"
alias zathura "nohup zathura $1"
alias ls "exa --group-directories-first --icons"
alias la "exa --group-directories-first --icons -a"
alias ll "exa --group-directories-first --icons -l"
alias cat "bat --style=plain --paging=never"
alias tree "exa -T --icons"
alias grep "grep --color=auto"
alias t "tree $1"
alias paru "paru --bottomup $1"

# Git
alias gaa "git add -A"
alias gc commit
alias gca "git add --all && git commit --amend --no-edit"
alias gco "git checkout"
alias gs "git status -sb"
alias gf "git fetch --all -p"
alias gps "git push"
alias gpsf "git push --force"
alias gpl "git pull"

# Workspace
alias w "cd ~/Workspace"
alias wh "cd ~/Workspace/Houlak"

alias dot "git --git-dir ~/.dotfiles --work-tree ~"

# Prompt

starship init fish | source
export PATH="$PATH:$HOME/.spicetify"
