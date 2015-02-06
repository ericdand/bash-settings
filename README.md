bash-settings
=================

Custom settings for bash, zsh, and vim. Most of the `.bashrc` was set up by [Lee](https://github.com/lgauthie). 

zsh stuff
=========

The `.zshrc` has only been tested on Linux.

You'll need to install `xsel` (`sudo apt-get install xsel`).

You will also need to install the zsh mods yourself. Here's how:

    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh
	git clone git://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh

This will drop them into a directory called `.zsh` in your home directory, as the `.zshrc` expects.
