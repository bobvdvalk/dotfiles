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

# Include extensions
include "$BASH_SOURCE$EXTEND"

# Set up go environment
export GOPATH="$HOME"
eval $(go env | sed -e 's/^/export /')

# Set up npm environment
export NPM_PACKAGES="${HOME}/.npm-packages"

# Set up path
export PATH="$PATH:$HOME/bin:$(find $HOME/src -name bin 2> /dev/null | paste -sd ':'):$NPM_PACKAGES/bin"

# Set up cd path
export CDPATH=".:$HOME:$GOPATH/src/github.com:$GOPATH/src/bitbucket.org"

# Set up manpath
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
