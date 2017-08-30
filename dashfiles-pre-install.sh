#!/bin/bash

# Git Configuration
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

git config --global url."git@github.com:".insteadOf "https://github.com/"
git config --global url."git@bitbucket.org:".insteadOf "https://bitbucket.org/" 
git config --global remote.origin.prune true
