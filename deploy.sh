#!/bin/bash

rm -rf ~/.config/nvim
ln -sf ~/yunusey/.dotfiles/config/nvim ~/.config/nvim

rm -rf ~/.bashrc
ln -sf ~/yunusey/.dotfiles/bash/.bashrc ~/.bashrc

rm -rf ~/.bash_aliases
ln -sf ~/yunusey/.dotfiles/bash/.bash_aliases ~/.bash_aliases

rm -rf ~/.bash_profile
ln -sf ~/yunusey/.dotfiles/bash/.bash_profile ~/.bash_profile

rm -rf ~/.bindings.sh
ln -sf ~/yunusey/.dotfiles/bash/.bindings.sh ~/.bindings.sh

rm -rf ~/.inputrc
ln -sf ~/yunusey/.dotfiles/bash/.inputrc  ~/.inputrc

rm -rf ~/.tmux.conf
ln -sf ~/yunusey/.dotfiles/tmux/tmux.conf ~/.tmux.conf
