# OS X specific .zshrc stuff.

# Use Exuberant Ctags
alias ctags="`brew --prefix`/bin/ctags"

# Use GNU ls rather than BSD ls so that it can group directories first.
if hash gls 2>/dev/null; then
	alias ls="gls --color=always --group-directories-first -lG"
else
	echo >&2 "ls is aliased to gls, but GNU ls is not installed." 
	echo >&2 "'brew install coreutils' to get gls."
	echo >&2 "Then source .zshrc again to update this alias."
fi

