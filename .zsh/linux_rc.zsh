# OS X specific .zshrc tidbits.
# Loaded midway through .zshrc, where all this stuff used to be inlined.

# Emulate OSX's "pbpaste" and "pbcopy" functions
# Remember to `apt-get install xsel`.
alias pbpaste='xsel --clipboard --output'
alias pbcopy='xsel --clipboard --input'

