# OS X specific .zshrc stuff.

# Use Exuberant Ctags
alias ctags="`brew --prefix`/bin/ctags"

# Use GNU ls rather than BSD ls so that it can group directories first.
if hash gls 2>/dev/null; then
	alias ls="gls --color=always --group-directories-first -o"
else
	echo >&2 "ls is aliased to gls, but GNU ls is not installed." 
	echo >&2 "'brew install coreutils' to get gls."
	echo >&2 "Then source .zshrc again to update this alias."
fi

# ~/bin is where all the coolest scripts go. B)
export PATH=$HOME/bin:$PATH
# Include /usr/local/sbin in the path, since some Homebrew tools install stuff there.
export PATH=/usr/local/sbin:$PATH
# Also include /opt/local/bin for MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# Enable iTerm2 "Shell Integration".
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Install the LOVE2D game engine.
if [[ -e ~/Application/love.app ]] then 
	alias love='~/Applications/love.app/Contents/MacOS/love'
fi
