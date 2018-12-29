#!/bin/sh

# Base system setup

sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf yay

git config --global user.email "zoe.helding@gmail.com"
git config --global user.name "Zoe Helding"

ln -s dotfiles/vimrc .vimrc
yay -S vim vundle flake8

yay -S ttf-dejavu nerd-fonts-dejavu-complete

ln -s dotfiles/zshrc .zshrc
yay -S zsh zsh-theme-powerlevel9k
chsh -s $(which zsh)

yay -S ranger w3m

yay -S pyenv python-pipenv

# Base i3-gaps setup

sudo rm /etc/lightdm
yay -S xorg-server i3-gaps lightdm lightdm-gtk-greeter termite dmenu i3status gvim
echo -e '[Desktop]\nSession=i3' >> ~/.dmrc

sudo groupadd -r autologin
sudo gpasswd -a zhelding autologin
sudo sed -i 's/#autologin-user=/autologin-user=zhelding/g' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm

# Desktop environment setup

ln -s ~/dotfiles/dunst ~/.config/dunst
ln -s ~/dotfiles/gtk-3.0 ~/.config/gtk-3.0
ln -s ~/dotfiles/i3 ~/.config/i3
ln -s ~/dotfiles/polybar ~/.config/polybar
ln -s ~/dotfiles/ranger ~/.config/ranger
ln -s ~/dotfiles/rofi ~/.config/rofi
ln -s ~/dotfiles/termite ~/.config/termite

yay -S xorg-xrdb
yay -S firefox
yay -S compton
yay -S arandr
yay -S feh jsoncpp jq polybar rofi dunst python-setuptools python-pywal oomox
yay -S pulseaudio pavucontrol
yay -S gpmdp

yay -S networkmanager
sudo systemctl enable NetworkManager

# hestia setup

yay -S linux-headers broadccom-wl-dkms
echo 'export GDK_DPI_SCALE=1.5' | sudo tee --append /etc/profile.d/gdkscale.sh

yay -S intel-ucode nvidia lib32-nvidia-utils

yay -S steam steam-fonts

yay -S light
sudo setpci -v -H1 -s 00:01.00 BRIDGE_CONTROL=0
