# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source .zshmods/zsh-history-substring-search.zsh
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Suffix aliases ("Open As...")
# ex.
# % test.c
#  > vim text.c
alias -s c=vim
alias -s h=vim
alias -s py=vim

# Requires installation of xsel tool
# Comment-out if using a Mac and not an X-based environment
alias pbpaste='xsel --clipboard --output'
alias pbcopy='xsel --clipboard --input'

