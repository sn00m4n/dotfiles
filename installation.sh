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

# CLI tools
yay -Sy --needed fish neovim neovim-plug tor rsync man thefuck openconnect texlive-most xorg-fonts ssss screen

# GUI Programms
yay -Sy --needed firefox thunderbird keepassxc nextcloud-client torbrowser-launcher okular spectacle libreoffice-fresh obsidian elisa gimp kcalc kate

# Messenger 
yay -Sy --needed schildichat-desktop-bin telegram-desktop

# IDEs
yay -S --needed goland pycharm-professional intellij-idea-ultimate-edition code goland-jre intellij-idea-ultimate-edition-jre

# change user shell to fish
sudo chsh -s /usr/bin/fish omikron
