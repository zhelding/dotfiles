#!/bin/sh

source base-setup.sh

# Base i3-gaps setup

yay -Rdd vim
yay -S --noconfirm xorg-server i3-gaps i3lock-color lightdm lightdm-gtk-greeter termite dmenu i3status gvim
echo -e '[Desktop]\nSession=i3' >> ~/.dmrc

sudo groupadd -r autologin
sudo gpasswd -a zhelding autologin
sudo sed -i 's/#autologin-user=/autologin-user=zhelding/g' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm

# Desktop environment setup

ln -s ~/dotfiles/dunst ~/.config/dunst
ln -s ~/dotfiles/gtk-3.0 ~/.config/gtk-3.0
rm -rf ~/.config/i3
ln -s ~/dotfiles/i3 ~/.config/i3
ln -s ~/dotfiles/polybar ~/.config/polybar
ln -s ~/dotfiles/ranger ~/.config/ranger
ln -s ~/dotfiles/rofi ~/.config/rofi
ln -s ~/dotfiles/termite ~/.config/termite

sudo ln -s ~/dotfiles/scripts/* /usr/local/bin/.

yay -S --noconfirm xorg-xrdb
yay -S --noconfirm chromium
yay -S --noconfirm compton
yay -S --noconfirm arandr
yay -S --noconfirm arc-gtk-theme feh jsoncpp jq polybar rofi dunst pacman-contrib python-setuptools python-pywal python-haishoku
yay -S --noconfirm pulseaudio pavucontrol playerctl
yay -S --noconfirm gpmdp
yay -S --noconfirm ruby
yay -S --noconfirm mir.qualia
yay -S --noconfirm dropbox
yay -S --noconfirm noto-fonts-emoji
yay -S --noconfirm networkmanager

sudo systemctl enable NetworkManager

# BEGIN hestia
#
#yay -S --noconfirm linux-headers broadcom-wl-dkms
#echo 'export GDK_DPI_SCALE=1.5' | sudo tee --append /etc/profile.d/gdkscale.sh
#
#yay -S --noconfirm intel-ucode nvidia lib32-nvidia-utils
#
#yay -S --noconfirm steam steam-fonts
#
#yay -S --noconfirm light
#sudo setpci -v -H1 -s 00:01.00 BRIDGE_CONTROL=0
#
# END hestia
