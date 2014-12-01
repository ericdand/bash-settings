set nocompatible

" tab and indentation stuff
filetype on
" indent by filetype
filetype plugin indent on
set autoindent
" make > and < shift by 4
set shiftwidth=4
" make tabs appear as 4 spaces (instead of default 8)
set tabstop=4
set nowrap

" show line numbers
set number

" syntax highlighting
syntax enable 

" backspace over anything
set backspace=2

" navigate using mouse
set mouse=a

" Make .py files use spaces instead of tabs,
" use the softtabstop feature for ease of navigation
autocmd filetype python setlocal expandtab softtabstop=4

" Only indent HTML by two
autocmd filetype html setlocal shiftwidth=2 tabstop=2

" Make the title of the window the currently-opened file.
autocmd BufReadPost,FileReadPost,BufNewFile * silent !print -Pn "\033]0;%\007"
" Turn it back to the currently-running process ($*) afterwards.
" Doctor the string as necessary to turn it back to your chosen value.
autocmd VimLeave * silent !print -Pn "\e]0;$*\a"

execute pathogen#infect()

