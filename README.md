# dotfiles

マシン（mac）初期設定

## brew

~~~
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
~~~

### install

- git 
- cmake
- boost
- zsh
- fontforge

## font

- ゆたぽん
- ttc2ttf
- fontforge


## finder

~~~
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
~~~

## alias

~~~
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
~~~

## Karabiner-Elements

~~~
git clone --depth 1 https://github.com/tekezo/Karabiner-Elements.git
~~~
- caps_lock -> left control
- vi mode[left command + hjkl]
- left command -> 英数
- right command -> 日本語
- esc + 英数
- ctrl + [ -> esc + 英数

