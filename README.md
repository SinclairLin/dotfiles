# dotfiles
- **Window Manager** • [Hyprland](https://github.com/hyprwm/Hyprland) 
- **Shell** • [Zsh](https://www.zsh.org) 
- **Terminal** • [kitty](https://github.com/kovidgoyal/kitty) 
- **Panel** • [Waybar](https://aur.archlinux.org/packages/waybar-hyprland-git) 
- **Notify Daemon** • [Dunst](https://github.com/dunst-project/dunst) 
- **Launcher** • [rofi](https://github.com/davatorium/rofi) 
- **File Manager** • [ranger](https://github.com/ranger/ranger) 


## hyprland 
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
## zsh
***!!waring!!*** **我使用的终端是[kitty](https://sw.kovidgoyal.net/kitty/)，如果你用的不是kitty，请注释掉`config/env`中`export TERM="xterm-kitty"`，和`config/aliases`中`alias ssh="kitty +kitten ssh"`**
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
- `zsh`,`lua`,`fd` in Arch Linux:
```
sudo pacman -S zsh lua fd

```
- fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Installation
clone 我的配置，复制到你的`~/.config`文件夹中：
```
git clone https://github.com/SinclairLin/dotfiles
cp -r ./dotfiles/config/zsh ~/.config/zsh/
echo "source ~/.config/zsh/omz.zsh" >> ~/.zshrc


```
### Plugins
- [zsh-extract](https://github.com/SinclairLin/zsh-extract)

> 定义一个`extract`函数，只需执行`extract <filename>`或`x <filename>`即可解压一个压缩文件。
> 这样就可以不必知道解压文件的具体命令，该函数会建立一个新的文件夹，然后将文件提取到新的文件夹中。
> 具体可以解压那些文件：[SinclairLin/zsh-extract](https://github.com/SinclairLin/zsh-extract/blob/master/README.md#supported-file-extensions)。


- [z.lua](https://github.com/skywind3000/z.lua)

> 使用`z <dir>`会帮你跳转到所有的路径里 Frecent 值最高的那条路径去。

**EXAMPLES:**
```
z foo       # 跳转到包含 foo 并且权重（Frecent）最高的路径
z foo bar   # 跳转到同时包含 foo 和 bar 并且权重最高的路径
z -r foo    # 跳转到包含 foo 并且访问次数最高的路径
z -t foo    # 跳转到包含 foo 并且最近访问过的路径
z -l foo    # 不跳转，只是列出所有匹配 foo 的路径
z -c foo    # 跳转到包含 foo 并且是当前路径的子路径的权重最高的路径
z -e foo    # 不跳转，只是打印出匹配 foo 并且权重最高的路径
z -i foo    # 进入交互式选择模式，让你自己挑选去哪里（多个结果的话）
z -I foo    # 进入交互式选择模式，但是使用 fzf 来选择
z -b foo    # 跳转到父目录中名称以 foo 开头的那一级
```

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

> 根据历史记录和完成情况在输入时建议命令。
> 使用快捷键`<right>`接受当前建议，`<^ right>`只接受一个word。

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

> 让`Zsh`可以实现类似`Fish shell`的语法高亮。

- [fzf-tab](https://github.com/Aloxaf/fzf-tab)

> 将`Zsh`的默认补全选择菜单替换为[fzf](https://github.com/junegunn/fzf)。

## waybar
![image-20230824234941666](https://images-1259814905.cos.ap-nanjing.myqcloud.com//picture/image-20230824234941666.png)
