# dotfiles
- **Window Manager** • [Hyprland](https://github.com/hyprwm/Hyprland) 
- **Shell** • [Zsh](https://www.zsh.org) 
- **Terminal** • [kitty](https://github.com/kovidgoyal/kitty) 
- **Panel** • [Waybar](https://aur.archlinux.org/packages/waybar-hyprland-git) 
- **Notify Daemon** • [Dunst](https://github.com/dunst-project/dunst) 
- **Launcher** • [rofi](https://github.com/davatorium/rofi) 
- **File Manager** • [ranger](https://github.com/ranger/ranger) 


## 1. hyprland 
```
./
├── scripts/          
│   └── xdph.sh
├── env.conf          
├── hyprland.conf     
├── hyprpaper.conf    
├── keybinds.conf     
├── startup.conf
└── windowrule.conf   
```
## 2. zsh

```
./
├── cache/
├── config/
├── lib/
├── plugins/
│   ├── extract/
│   ├── fzf-tab/
│   ├── z.lua/
│   ├── zsh-autosuggestions/
│   └── zsh-syntax-highlighting/
├── themes/
└── omz.zsh
```
### Requires
- zsh
```
sudo pacman -S zsh  # Arch Linux

```
- fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
- lua
```
sudo pacman -S lua
```
- fd
```
sudo pacman -S fd    
```

### Install
```
git clone https://github.com/SinclairLin/dotfiles
cp -r ./dotfiles/config/zsh ~/.config 
echo "source ~/.config/zsh/omz.zsh" >> ~/.zshrc
```

## 3. waybar
![image-20230824234941666](https://images-1259814905.cos.ap-nanjing.myqcloud.com//picture/image-20230824234941666.png)
