#!/usr/bin/env bash

# Bootstrap packages for yay
sudo pacman -Sy --needed base-devel git

# /opt owned by ally:ally
sudo chown -R ally:ally /opt

# yay installation
cd /opt && git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd -

# Programming Languages
yay -Sy --needed jdk-openjdk jre-openjdk rustup

# Java
yay -Sy --needed gradle gradle-doc gradle-src

# Python
yay -Sy --needed python python-pip


# Screen capture
yay -Sy --needed xdg-desktop-portal xdg-desktop-portal-kde


# CLI tools
yay -Sy --needed fish neovim neovim-plug tor rsync man thefuck openconnect texlive-most xorg-fonts screen nginx wireguard-tools traceroute unzip vagrant clang ansible vagrant

# GUI Programms
yay -Sy --needed firefox thunderbird keepassxc torbrowser-launcher okular spectacle libreoffice-fresh obsidian gimp kcalc kate inkscape kget ktorrent gwenview krdc virt-manager qemu-desktop musescore etcher-bin kile chromium calibre brave-bin


# FS tools
yay -Sy --needed gparted unrar

# CAD
yay -Sy --needed blender

# Messenger 
yay -Sy --needed schildichat-desktop-bin element-desktop

# Pentesting
yay -Syu --needed nmap gobuster-bin massscan metasploit

# IDEs
yay -S --needed pycharm-professional code clion clion-lldb clion-gdb clion-jr

# Locales
sudo echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
sudo echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen 
sudo localedef -i de_DE -f UTF-8 en_DE.UTF-8

# change user shell to fish
sudo chsh -s /usr/bin/fish ally

sudo usermod -a -G uucp ally

# Virt-Manager
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -a -G libvirt ally
echo "unix_sock_group = 'libvirt'" | sudo tee -a /etc/libvirt/libvirtd.conf
echo "unix_sock_rw_perms = '0770'" | sudo tee -a /etc/libvirt/libvirtd.conf
echo "user = \"ally\"" | sudo tee -a /etc/libvirt/qemu.conf
echo "group = \"ally\"" | sudo tee -a /etc/libvirt/qemu.conf
echo "memory_backing_dir = \"/dev/shm\"" | sudo tee -a /etc/libvirt/qemu.conf

# Let ally use virtualization without password
sudo cp 80-libvirt.rules /etc/polkit-1/rules.d/80-libvirt.rules


# Vagrant
vagrant plugin install vagrant-libvirt
