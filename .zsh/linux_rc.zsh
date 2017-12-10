# OS X specific .zshrc tidbits.
# Loaded midway through .zshrc, where all this stuff used to be inlined.

# Emulate OSX's "pbpaste" and "pbcopy" functions
# Remember to `apt-get install xsel`.
alias pbpaste='xsel --clipboard --output'
alias pbcopy='xsel --clipboard --input'

alias ls="ls --color=always --group-directories-first -lG"

# Source the latest version of go
# You can install it like so:
# 	sudo add-apt-repository ppa:gophers/archive
# 	sudo apt update
# 	sudo apt-get install golang-1.9.go
export PATH="${PATH}:/usr/lib/go-1.9/bin"
