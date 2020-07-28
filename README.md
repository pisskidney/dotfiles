# Peter Horvath's dotfiles.
Welcome to my dotfiles, where originality doesn't matter and most things are stolen.

## Set-up
Run `curl -s -L https://github.com/pisskidney/dotfiles/raw/master/bootstrap.sh | /bin/bash`

Install zsh (sudo apt-get install zsh)
Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)

* **What this all does:**
    - clones the dotfiles repo to ~/.dotfiles
    - creates proper symlinks to all config files
    - sets up vundle
    - installs dependencies (pyflakes, pep8, ctags, etc...)
