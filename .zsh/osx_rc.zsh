# OS X specific .zshrc stuff.

# Use GNU ls rather than BSD ls so that it can group directories first.
if hash gls 2>/dev/null; then
	alias ls="gls --color=always --group-directories-first -l"
else
	echo >&2 "ls is aliased to gls, but GNU ls is not installed." 
	echo >&2 "'sudo port install coreutils' to get gls."
	echo >&2 "Then source .zshrc again to update this alias."
fi

export PATH=$HOME/.docker/bin:$PATH
# ~/bin is where all the coolest scripts go. B)
export PATH=$PATH:$HOME/bin
# Include /usr/local/sbin in the path, since some Homebrew tools install stuff there.
export PATH=$PATH:/usr/local/sbin
# Also include /opt/local/bin for MacPorts. Prefer it over the built-ins, as it
# requires sudo permissions to write to /opt/local/* paths.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# Enable iTerm2 "Shell Integration".
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Install the LOVE2D game engine.
if [[ -e ~/Application/love.app ]] then 
	alias love='~/Applications/love.app/Contents/MacOS/love'
fi

# Brew's esphome doesn't put esptool on the path.
# TODO generalize this for any esphome path.
# TODO also, install this from macports rather than Brew.
if [[ -e /usr/local/Cellar/esphome/2024.11.3_1/libexec/bin/esptool.py ]] then
	alias esptool.py='/usr/local/Cellar/esphome/2024.11.3_1/libexec/bin/esptool.py'
	alias esptool='esptool.py'
fi
