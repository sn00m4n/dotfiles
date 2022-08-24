#!/usr/bin/env bash

# Bootstrap packages for yay
sudo pacman -Sy --needed base-devel git

# /opt owned by omikron:omikron
sudo chown -R omikron:omikron /opt

# yay installation
cd /opt && git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd -

# Programming Languages
yay -Sy --needed go gopls go-tools jdk-openjdk jre-openjdk rustup nodejs npm

# Rust
cargo install wasm-pack

# Java
yay -Sy --needed gradle gradle-doc gradle-src

# D
yay -Sy --needed dlang

# Python
yay -Sy --needed python python-pip

# Libraries
yay -Sy --needed fmt qt5-imageformats kimageformats kamera noto-fonts-cjk mariadb-client nfs-utils

# Screen capture
yay -Sy --needed xdg-desktop-portal xdg-desktop-portal-kde obs-studio

# Canon webcam setup
yay -Sy --needed gphoto2  

# CLI tools
yay -Sy --needed fish neovim neovim-plug tor rsync man thefuck openconnect texlive-most xorg-fonts ssss screen nginx wireguard-tools traceroute unzip cpanminus dnsmasq lxd vagrant clang ansible cups

# GUI Programms
yay -Sy --needed firefox thunderbird keepassxc nextcloud-client torbrowser-launcher okular spectacle libreoffice-fresh obsidian elisa gimp kcalc kate inkscape kget ktorrent gwenview krdc virt-manager qemu-desktop musescore etcher-bin darktable kile cups system-config-printer

# Remote desktop
yay -Sy --needed libvncserver libssh freerdp keditbookmarks

# FS tools
yay -Sy --needed gparted dosfstools jfsutils f2fs-tools mtools gpart nilfs-utils xfsprogs udftools ntfs-3g reiserfsprogs exfatprogs btrfs-progs

# CAD
yay -Sy --needed kicad kicad-library kicad-library-3d pcbdraw freecad

# Messenger 
yay -Sy --needed schildichat-desktop-bin telegram-desktop

# IDEs
yay -S --needed goland pycharm-professional intellij-idea-ultimate-edition code goland-jre intellij-idea-ultimate-edition-jre

# Locales
sudo echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
sudo echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen 
sudo localedef -i de_DE -f UTF-8 en_DE.UTF-8

# change user shell to fish
sudo chsh -s /usr/bin/fish omikron

sudo usermod -a -G uucp omikron

# Virt-Manager
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -a -G libvirt omikron
echo "unix_sock_group = 'libvirt'" | sudo tee -a /etc/libvirt/libvirtd.conf
echo "unix_sock_rw_perms = '0770'" | sudo tee -a /etc/libvirt/libvirtd.conf
echo "user = \"omikron\"" | sudo tee -a /etc/libvirt/qemu.conf
echo "group = \"omikron\"" | sudo tee -a /etc/libvirt/qemu.conf

# LXD
sudo systemctl enable lxd.service
sudo systemctl start lxd.service
sudo lxd init
sudo usermod -a -G lxd omikron
sudo lxc profile set default security.secureboot=false
