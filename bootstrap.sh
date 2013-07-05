#!/bin/bash

if [ -d ~/.dotfiles ]; then
    cd ~/.dotfiles
    git pull
else
    git clone git://github.com/pisskidney/dotfiles.git ~/.dotfiles/
    for cf in ~/.dotfiles/confs/*; do
        ln -s "$cf" ~/.$(basename "$cf")
    done
fi
