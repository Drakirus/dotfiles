dotfiles
===================
![screenshot](https://github.com/mscoutermarsh/dotfiles/blob/master/screenshot.png)
(Here's what my setup looks like. Vim/Tmux)

## New to Vim?
+ [Learning Vim in a Week](https://mikecoutermarsh.com/boston-vim-learning-vim-in-a-week/)
+ [Vim and Tmux](https://www.youtube.com/watch?v=5r6yzFEXaj)

## Apt-Installation
```
$ cd dotfiles/
$ chmod +x -R install
$ ./install/....
```
You can chose to install :
* Atom with my usual plugins
* Atom remote (useful on serveur)
* Java :grimacing:
* Node Js
   * That comes with [tldr-man-pages](https://github.com/tldr-pages/tldr)
* Vim-bundles (Installation of vim Plugins with vundle)
* xfce (just my own tweaks)
* zsh :heart:

## Installation

Clone this repo (or your own fork!) to your **home** directory (`/Users/username`).

```
$ cd ~
$ git clone https://github.com/Drakirus/dotfiles.git dotfiles
```
#### Install RCM

It's a management suite for dotfiles.
Download here: https://github.com/thoughtbot/rcm

Run rcm (this command expects that you cloned your dotfiles to `~/dotfiles/`)
```
$ env RCRC=$HOME/dotfiles/rcrc rcup
```
RCM creates dotfile symlinks ex.(`.vimrc` -> `/dotfiles/vimrc`) from your home directory to your `/dotfiles/` directory.

### Installing Vim Plugins
Plugins are listed in `vimrc.bundles`.
```
# if not already done above
$ cd dotfiles/ && chmod +x -R ./install/vimBundle && ./install/vimBundle
```
> You can also install vundle by yourself, then open vim (`$ vim`) and type `:BundleInstall`. And then restart vim. You'll need to do this for all the plugins to work.

### Git Config
Make sure you update ```gitconfig``` with your own name and email address. Otherwise you'll be committing as me. :smile_cat:

#### Custom Fonts
You'll need to use a custom font for Airline to look nice. (Seeing weird symbols? This is why!). See here: https://github.com/Lokaltog/powerline-fonts
I use *hack* (size 12).

### Recommended

**Tmux**
```
$ sudo apt-get install tmux
```

For OSX,
```
# Add this to tmux.conf et-option -g default-command "reattach-to-user-namespace -l zsh -l"
$ brew install reattach-to-user-namespace
```
---
These are a modified version of Thoughtbot's dotfiles.
More detailed instructions are available here: https://github.com/mscoutermarsh/dotfiles
And here: http://github.com/thoughtbot/dotfiles
