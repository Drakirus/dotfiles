My . Files
===================
![Fullscreen](https://raw.githubusercontent.com/Drakirus/dotfiles/master/screenshot.png)  
(Here's what my setup looks like)

## Mouse

```sh
# config range
less /var/log/Xorg.0.log | grep -i range
# Palm detection config
synclient PalmDetect=1 PalmMinWidth=0 PalmMinZ=0
# disable Right side of trackpad
synclient AreaLeftEdge=100 AreaRightEdge=850 AreaTopEdge=70
```
> /etc/X11/xorg.conf.d/10-synaptics.conf
``` conf
Section "InputClass"
        Identifier "touchpad catchall"
        Driver "synaptics"
        MatchIsTouchpad "on"
                Option "PalmDetect" "1"
                Option "PalmMinWidth" "8"
                Option "PalmMinZ" "100"
                Option "AreaLeftEdge" "100"
                Option "AreaRightEdge" "850"
                Option "AreaTopEdge" "70"
EndSection
```

## Installation

#### Clone
Clone this repo (or your own fork!) to your **home** directory (`/home/{USERNAME}/dotfiles`).

``` sh
cd ~
git clone https://github.com/Drakirus/dotfiles.git dotfiles
chmod +x -R dotfiles/install
```

#### Dotfiles

RC file (dotfile) management.  
(this command expects that you cloned your dotfiles to `~/dotfiles/`)

``` sh
~/dotfiles/install/dotfiles
```

It creates symlinks ex.(`.vimrc` -> `~/dotfiles/vimrc`) from your home directory to your `~/dotfiles/` directory.  

### Vim

```
~/dotfiles/install/vimplug
```

> Used to Install / Update / Clean all vim's Plugins

``` sh
sudo apt-get install libluajit-5.1
make distclean
./configure --enable-luainterp=yes \
            --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-python3interp \
            --enable-perlinterp
make
sudo make install
```

> Used to install vim

### Apt-Installll

``` sh
$ cd ~/dotfiles/
$ ./install/....
```

You can choose to install :  
* Atom with my usual plugins
* Node Js
   * with [tldr-man-pages](https://github.com/tldr-pages/tldr)
* Dotfiles
* Vim-Plugins (Installation of vim Plugins with [Vim-Plug](https://github.com/junegunn/vim-plug))
* xfce (just my own tweaks)
* zsh :heart:


### Git Configuration
Make sure you update `gitconfig` with your own name and email address otherwise, you'll be committing as me. :smile_cat:  
`git config github.user {USERNAME}`  
`git config --global core.excludesfile ~/.gitignore`  
`git config --global commit.template ~/.gitmessage`  

### Custom Fonts
You'll need to use a custom font for statusline to look nice. (Seeing weird symbols? This is why!).  
```sh
./fonts/install.sh
```
> I use *hack* (size 12).  

---

### Terminal emulator

```
setxkbmap -option caps:escape &
```


```
for x in $(cat package_list.txt); do pacman -S $x; done
```

https://www.archlinux.org/packages/community/x86_64/termite/  



terminus.vim
```
    inoremap <expr><f20> pumvisible() ? "<c-e><c-o>:silent doautocmd <nomodeline> FocusLost %<cr>" : "<c-o>:silent doautocmd <nomodeline> FocusLost %<cr>"

```

clock.xfce.panel

```
<span  font='8.'>%d-%m-%Y%n</span><span  font_weight='ultrabold'>%R</span>
```


These are a modified version of Thoughtbot's dotfiles.  
More detailed instructions are available here:  
https://github.com/mscoutermarsh/dotfiles /
http://github.com/thoughtbot/dotfiles
