#!/bin/bash


# Prompt for global git configuration
if [ -z "$(git config user.name)" ]; then
    printf "No name was set in git. What is your name? "
    read gitName
    git config --global user.name "$gitName"
fi

if [ -z "$(git config user.email)" ]; then
    printf "No email was set in git. What is your email? "
    read gitEmail
    git config --global user.email "$gitEmail"
fi

git config --global remote.origin.prune true

# Install Vundle
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Update Vundle Plugins
vim +PluginUpdate +qall
