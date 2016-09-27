Dotfiles
===================
![Fullscreen](https://raw.githubusercontent.com/Drakirus/dotfiles/master/screenshot.png)  
(Here's what my setup looks like)

## Installation

#### Clone
Clone this repo (or your own fork!) to your **home** directory (`/home/{USERNAME}/dotfiles`).

``` sh
$ cd ~
$ git clone https://github.com/Drakirus/dotfiles.git dotfiles
$ chmod +x -R dotfiles/install
```

#### Dotfiles

RC file (dotfile) management.  
(this command expects that you cloned your dotfiles to `~/dotfiles/`)

``` sh
$ ~/dotfiles/install/dotfiles
```

It creates symlinks ex.(`.vimrc` -> `~/dotfiles/vimrc`) from your home directory to your `~/dotfiles/` directory.  

### Vim Plugins
Plugins are listed in `vimrc.bundles`.

```
$ ~/dotfiles/install/vimplug
```

> Used to Install / Update / Clean all vim's Plugins

``` sh
sudo apt-get install libluajit-5.1
./configure --enable-luainterp=yes \
            --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-python3interp \
            --enable-perlinterp
```

> Used to configure before make

### Apt-Installll

``` sh
$ cd ~/dotfiles/
$ ./install/....
```

You can choose to install :  
* Atom with my usual plugins
* Atom remote (useful on serveur)
* Java
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
You'll need to use a custom font for Airline to look nice. (Seeing weird symbols? This is why!).  
See here: https://github.com/Lokaltog/powerline-fonts
> I use *hack* (size 12).  
> Get the icons fonts used in NerdTree here: https://github.com/ryanoasis/nerd-fonts#font-installation

### TMUX

TODO

```
$ sudo apt-get install tmux
```

---

### TODO

rxvt-unicode-256color  


These are a modified version of Thoughtbot's dotfiles.  
More detailed instructions are available here:  
https://github.com/mscoutermarsh/dotfiles / 
http://github.com/thoughtbot/dotfiles
