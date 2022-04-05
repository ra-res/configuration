#!/bin/bash

# vim
cp .vimrc ~/.vimrc

# bash
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
cp .inputrc ~/.inputrc

# zsh
cp .zshrc ~/.zshrc

# tmux 
cp .tmux.conf ~/.tmux.conf

# intellij
cp .ideavimrc ~/.ideavimrc

# Xmodmap
cp .Xmodmap ~/.Xmodmap  
xmodmap ~/.Xmodmap  

# nvim
rm -rf  ~/.config/nvim
cp -r ./nvim_lua/ ~/.config/nvim
