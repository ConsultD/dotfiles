#!/bin/bash


# Install VIM Plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/bin
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim
cp ./alacritty.yml ~/.config/alacritty/alacritty.yml
cp -R colors ~/.config/alacritty/
cp ./dot_tmux.conf ~/.tmux.conf
cp ./dot_vimrc ~/.vimrc
cp ./init.vim ~/.config/nvim/init.vim
cp bin/* ~/bin

# Git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'




