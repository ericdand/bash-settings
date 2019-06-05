".vimrc
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

" show line and column numbers
set number
set ruler

" syntax highlighting
syntax enable 

" backspace over anything
set backspace=2

" navigate using mouse
set mouse=a

" Make .py files use spaces instead of tabs
" use the softtabstop feature for ease of navigation
autocmd filetype python setlocal expandtab softtabstop=4
" Same for renpy, but with 2-space tabs instead
autocmd filetype renpy setlocal expandtab shiftwidth=2 softtabstop=2
" And with Arduino (plus we have to teach Vim about .ino files)
autocmd BufRead,BufNewFile *.ino set filetype=arduino
autocmd filetype arduino setlocal expandtab shiftwidth=2 softtabstop=2
" Only indent HTML by two
autocmd filetype html setlocal shiftwidth=2 tabstop=2

" Make the title of the window the currently-opened file.
autocmd BufEnter * silent !echo -ne "\033]0;%\007"
" Turn it back to the currently-running process ($*) afterwards.
" Doctor the string as necessary to turn it back to your chosen value.
autocmd VimLeave * silent !echo -ne "\033]0;$*\007"

" Allow the use of Ctrl-S to save.
" Make sure that you've also disabled the 'ixon' flag in your terminal
" by using `stty -ixon` in your .bashrc/.zshrc.
noremap <silent>  	<C-S>	:w<CR>
vnoremap <silent> 	<C-S>	<ESC>:w<CR>
" See http://vim.wikia.com/wiki/Use_Ctrl-O_instead_of_Esc_in_insert_mode_mappings
inoremap <silent> 	<C-S>	<C-O>:w<CR>

