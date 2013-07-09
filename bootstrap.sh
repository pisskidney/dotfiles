#!/bin/sh

if [ -d ~/.dotfiles ]; then
    cd ~/.dotfiles
    git pull
else
    git clone https://github.com/pisskidney/dotfiles.git ~/.dotfiles/
    for cf in ~/.dotfiles/confs/*; do
        ln -s "$cf" ~/.$(basename "$cf")
    done
fi

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
sudo pip install pep8
sudo pip install pyflakes
vim - +BundleInstall! +BundleClean! +qall
