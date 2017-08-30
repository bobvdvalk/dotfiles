#!/bin/bash

# Set Oracle JDK8 as prefered java
if [ "$(archlinux-java get)" != "java-8-jdk" ]; then 
    sudo archlinux-java set java-8-jdk
fi

# Install Vundle
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Update Vundle Plugins
vim +PluginUpdate +qall

# Set Gnome Theme to Numix Frost
gsettings set org.gnome.desktop.interface gtk-theme 'Numix-Frost'

# Disable menu bar by default
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

# Enable gdm
sudo systemctl disable lightdm.service && sudo systemctl enable gdm

# Delete obsolete folders
rm -rf ~/Music ~/Videos ~/Pictures ~/Desktop ~/Public ~/Templates ~/Videos

# Enable night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
