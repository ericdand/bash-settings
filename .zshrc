# The following lines were added by compinstall
zstyle :compinstall filename '/home/eric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# These need to be added to your ~/.zsh folder yourself! Search GitHub.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

#zsh-history-substring-search keybinds
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# end zsh-history-substring-search keybinds

# emulates the convenient OS X "pbpaste" and "pbcopy" functions
# unnecessary if you're already using OS X
# remember to `apt-get install xsel`
alias pbpaste='xsel --clipboard --output'
alias pbcopy='xsel --clipboard --input'

alias ls="ls --color=always --group-directories-first -lG"
alias rmdir="rm -r"

# remember to add yourself to the "dialout" group before using picocom
alias picocom="picocom --omap delbs -c -b 115200"

