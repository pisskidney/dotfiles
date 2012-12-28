Peter Horvath's dotfiles.
=========================
Welcome to my dotfiles, where originality doesn't matter and most things are stolen.

Vim
===
Install plugins by getting the .gitmodules file and running:

    git submodule sync
    git submodule init
    git submodule update
    git submodule foreach git pull origin master
    git submodule foreach git submodule init
    git submodule foreach git submodule update

.gitignore
==========
A general purpose file to block most trash filetypes / folders.
