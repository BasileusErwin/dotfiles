![Neovim](../../.screenshots/nvim.png)

```sh
# ArchLinux
sudo pacman -S nodejs npm python python-pip ruby rubygems xsel fzf ripgrep fd prettier --noconfirm

# Download neovim packages
pip install neovim
gem install neovim
sudo npm i -g neovim

# Packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
       
# My Neovim
git clone https://github.com/KaiserErwin/dotfiles.git
cp -r dotfiles/nvim ~/.config/nvim
```

Then execute ```:PackerInstall``` inside neovim and it should be ready.

