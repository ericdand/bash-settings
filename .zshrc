# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# Bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Emulate OSX's "pbpaste" and "pbcopy" functions
# Remember to `apt-get install xsel`.
alias pbpaste='xsel --clipboard --output'
alias pbcopy='xsel --clipboard --input'

alias ls="ls --color=always --group-directories-first -lG"
alias rmdir="rm -r"

# "Real" Chrome is available as a .deb from Google's website.
# Unfortunately they named it "google-chrome", which is far too long.
alias chrome="google-chrome"

# Remember to add yourself to the "dialout" group first!
alias picocom="picocom --omap delbs -c -b 115200"

# Set a cool colour prompt. B)
autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%{$fg[yellow]%}%~ %{$reset_color%}# "

# Set RPS1 (Right PS1) to show whether we're in vi "Normal" mode.
#
# From the zsh documentation:
# "zle-keymap-select is executed every time the keymap changes, 
# i.e. the special parameter KEYMAP is set to a different value, 
# while the line editor is active. 
# Initialising the keymap when the line editor
# starts does not cause the widget to be called. 
# This can be used for detecting switches between the 
# vi command (vicmd) and insert (usually main) keymaps."
function zle-line-init zle-keymap-select {
RPS1="%{$fg_bold[white]%} ${${KEYMAP/vicmd/[% NORMAL]% }/(main|viins)/}%{$reset_color%}"
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Decrease delay changing between vi modes to 0.1s.
export KEYTIMEOUT=1

# Fix "Home" and "End" keys to work properly.
# Before this will work, you need to run `autoload zkbd; zkbd` 
# to write the "xterm-:0.0" file to the .zkbd directory.
autoload zkbd
source ~/.zkbd/$TERM-:0.0
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line

# Disable the ixon flag so that Ctrl-s doesn't stop the terminal.
# This isn't necessary on all terminals, but it does no harm.
# We map Ctrl-s to ":w" (ie. "Save") in the .vimrc.
stty -ixon
