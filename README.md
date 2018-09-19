bash-settings
=================

Custom settings for bash, zsh, and vim. Most of the `.bashrc` was set up by [Lee](https://github.com/lgauthie). 

zsh stuff
=========

If you're on Linux, you'll need to install `xsel` (`sudo apt-get install xsel`).

You will also need to install the zsh mods yourself. Here's how:

	cd ~/.zsh
    git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
	git clone git@github.com:zsh-users/zsh-history-substring-search.git

This will drop them into a directory called `.zsh` in your home directory, as the `.zshrc` expects.

There are supplemental zsh scripts for OS X and Linux; check out the `.zsh` folder to see them.

