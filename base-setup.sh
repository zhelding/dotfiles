#!/bin/sh

# Base system setup

cd ~
sudo pacman -S --noconfirm git go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -i --noconfirm
cd ~
rm -rf yay

git config --global user.email "zoe.helding@gmail.com"
git config --global user.name "Zoe Helding"

ln -s dotfiles/vimrc .vimrc
yay -S --noconfirm vim vundle flake8 fzf tmux aws-cli powerline openssh

ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

yay -S --noconfirm ttf-dejavu nerd-fonts-dejavu-complete powerline-fonts

ln -s dotfiles/zshrc .zshrc
yay -S --noconfirm zsh zsh-theme-powerlevel9k
sudo chsh -s $(which zsh) zhelding

yay -S --noconfirm ranger w3m

yay -S --noconfirm pyenv python-pipenv
