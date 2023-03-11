![Neovim](../../.screenshots/nvim.png)

```sh
# ArchLinux
paru -S eslint standard cmake-language-server \
  nodejs npm python python-pip ruby rubygems xsel fzf ripgrep fd \
  prettier bash-language-server haskell-language-server \ 
  lua-language-server sqls lazygit shellcheck diagnostic-languageserver \
  fixjson flake8 python-flake8-isort python-pylint --noconfirm

pip install neovim
gem install neovim
sudo npm i -g neovim vscode-css-languageservice vscode-json-languageservice \
  vscode-html-languageservice prettier typescript-language-server \
  vscode-langservers-extracted yaml-language-server

cargo install languagetool-rust --features full

# My Neovim
git clone https://github.com/KaiserErwin/dotfiles.git
cp -r dotfiles/nvim ~/.config/nvim
```
