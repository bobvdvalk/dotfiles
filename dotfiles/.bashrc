#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '
export EXTEND=".extended"
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/vim

# Add some utility functions
function include {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

# Include Aliases
include "$HOME/.bash_aliases"

# Enable Powerline
include "/usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh"

# Enable Numlock
numlockx on

# Include extensions
include "$BASH_SOURCE$EXTEND"

# Set up go environment
eval $(go env | sed -e 's/^/export /')

# Set up path
export PATH="$PATH:$HOME/bin:$(go env GOPATH)/bin"


