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
yay -Sy --needed go gopls go-tools python jdk-openjdk jre-openjdk rustup nodejs npm

# Rust
cargo install wasm-pack

# Java
yay -Sy --needed gradle gradle-doc gradle-src

# Libraries
yay -Sy --needed fmt qt5-imageformats kimageformats kamera noto-fonts-cjk

# CLI tools
yay -Sy --needed fish neovim neovim-plug tor rsync man thefuck openconnect texlive-most xorg-fonts ssss screen nginx

# GUI Programms
yay -Sy --needed firefox thunderbird keepassxc nextcloud-client torbrowser-launcher okular spectacle libreoffice-fresh obsidian elisa gimp kcalc kate inkscape kget ktorrent gwenview

# FS tools
yay -Sy --needed gparted dosfstools jfsutils f2fs-tools mtools gpart nilfs-utils xfsprogs udftools ntfs-3g reiserfsprogs exfatprogs btrfs-progs

# CAD
yay -Sy --needed kicad kicad-library kicad-library-3d pcbdraw freecad

# Messenger 
yay -Sy --needed schildichat-desktop-bin telegram-desktop

# IDEs
yay -S --needed goland pycharm-professional intellij-idea-ultimate-edition code goland-jre intellij-idea-ultimate-edition-jre

# change user shell to fish
sudo chsh -s /usr/bin/fish omikron
