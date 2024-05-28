# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch prompt_subst
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Too slow!
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

# Load from OS-specific scripts
case `uname` in
  Darwin)
    source ~/.zsh/osx_rc.zsh
  ;;
  Linux)
    source ~/.zsh/linux_rc.zsh
  ;;
esac

alias rmdir="rm -r"
alias k9="kill -9"

# "Real" Chrome is available as a .deb from Google's website.
# Unfortunately they named it "google-chrome", which is far too long.
alias chrome="google-chrome"

# Remember to add yourself to the "dialout" group first!
alias picocom="picocom --omap delbs -c -b 115200"

# Set a cool colour prompt. B)
autoload -U colors && colors
PS1='%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%M%{$reset_color%}:%{$fg[yellow]%}%~ %{$reset_color%}# '

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
RPS1='%{$fg_bold[white]%} ${${KEYMAP/vicmd/[% NORMAL]% }/(main|viins)/}%{$reset_color%}'
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
source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char

# Disable the ixon flag so that Ctrl-s doesn't stop the terminal.
# This isn't necessary on all terminals, but it does no harm.
# We map Ctrl-s to ":w" (ie. "Save") in the .vimrc.
stty -ixon
#
# Make ~/bin the very first thing on the PATH.
export PATH=~/bin:${PATH}
#
# Golang stuff
export GOPATH=~/go
export PATH=${PATH}:${GOPATH}/bin

# I use zmv regularly. Load it automatically.
autoload zmv

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi

function ipnfo() {
  if [[ $1 =~ '-?-?h(elp)?' ]] then
    # You didn't *really* want 'http://ipinfo.io/help', did you?
    cat <<-EOM
      ipjnfo queries ipinfo.io, then pipes the JSON response to jq.

      usage:
        ipjnfo <ipinfo-query> <jq-filter>
      args:
        ipinfo-query: Everything after the '/'; e.g. '8.8.8.8' or 'google.com'
        jq-filter: the jq filter to apply (see 'man jq')
    EOM
  fi

  QUERY=$1
  FILTER=$2
  curl --silent --no-buffer -H 'Accept: application/json' ipinfo.io/${QUERY} | jq ${FILTER}
}
