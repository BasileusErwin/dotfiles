# Qtile

![qtile](../../.screenshots/Qtile.png)

## Installation
```sh
# ArchLinux
sudo pacman -S qtile pacman-contrib --noconfirm
paru -S nerd-fonts-ubuntu-mono

git clone https://github.com/KaiserErwin/dotfiles.git
cp -r dotfiles/.config/qtile ~/.config/
cp -r dotfiles/.config/rofi ~/.config/
```

If the network widget doesn't work check ```./components/primary_widgets.py``` and look
for this line, you should find it inside a list called *primary_widgets*:

```python
# Change interface arg, use ip address to find which one you need
 widget.Net(**base(bg='color3'), interface='wlp2s0'),
```

## Themes

To set a theme, check which ones are available in ```./themes```, and write
the name of the theme you want in a file named ```./config.json```:

```json
{
    "theme": "material-ocean"
}
```

Settings inspired by dotfiles of **[Antonio Sarosi](https://github.com/antoniosarosi/dotfiles/)**
