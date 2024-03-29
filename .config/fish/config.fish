function commit
  git commit -m $argv
end

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

eval (ssh-agent -c)
cat ~/.ssh/id_rsa | SSH_ASKPASS=~/.print_ssh_password ssh-add -
clear

set -x PATH $HOME/.deno/bin:$HOME/.dotnet/tools:$PATH

set FREETYPE_PROPERTIES "truetype:interpreter-version=35"

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
alias paru "paru --skipreview --bottomup $1"
alias c. "code ."

# Git

# Add
alias gaa "git add -A"

# Branch
alias gb "git branch"
alias gba "git branch --all --verbose"

# Checkout
alias gco "git checkout"
alias gbc "git checkout -b"

# Commit
alias gc "git commit --verbose"

# Status
alias gs "git status -sb"

# Fetch
alias gf "git fetch --all -p"

# Push
alias gps "git push"

# Pull
alias gpl "git pull"

# Merge (m)
alias gm 'git merge'

# Rebase (r)
alias gr 'git rebase'
alias gra 'git rebase --abort'
alias grc 'git rebase --continue'
alias gri 'git rebase --interactive'
alias grs 'git rebase --skip'

# Working Copy
alias gd "git diff --no-ext-diff --cached"

# Workspace
alias w "cd ~/Workspace"
alias wh "cd ~/Workspace/Houlak"

alias dot "git --git-dir ~/.dotfiles --work-tree ~"

alias config "cd ~/.config"

# Prompt

starship init fish | source
export PATH="$PATH:$HOME/.spicetify"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/$HOME/.ghcup/bin $PATH # ghcup-env
