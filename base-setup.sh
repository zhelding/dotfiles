#!/bin/sh

# Base system setup

cd ~
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf yay

git config --global user.email "zoe.helding@gmail.com"
git config --global user.name "Zoe Helding"

ln -s dotfiles/vimrc .vimrc
yay -S vim vundle flake8 fzf tmux aws-cli powerline

ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

yay -S ttf-dejavu nerd-fonts-dejavu-complete powerline-fonts

ln -s dotfiles/zshrc .zshrc
yay -S zsh zsh-theme-powerlevel9k
chsh -s $(which zsh)

yay -S ranger w3m

yay -S pyenv python-pipenv
