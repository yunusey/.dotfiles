#!/bin/bash

rm -rf ~/.config/nvim
ln -sf ~/yunusey/.dotfiles/config/nvim ~/.config/nvim

rm -rf ~/.bashrc
ln -sf ~/yunusey/.dotfiles/bash/bashrc ~/.bashrc

rm -rf ~/.inputrc
ln -sf ~/yunusey/.dotfiles/bash/inputrc  ~/.inputrc

rm -rf ~/.tmux.conf
ln -sf ~/yunusey/.dotfiles/tmux/tmux.conf ~/.tmux.conf
