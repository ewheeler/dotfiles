" disable word wrap
set nowrap

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Show menu with possible tab completions
set wildmenu

" ignore case when searching (see smartcase)
set ignorecase

" do not ignore case if pattern has mixed case (see ignorecase)
set smartcase

" round alignment to nearest indent when shifting with < and >
set shiftround

" keep indentation from previous line
set autoindent

" smartindent after beginning a block
set smartindent
au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" set tabs to eight characters wide
" http://docs.python.org/reference/lexical_analysis.html#indentation
au BufRead,BufNewFile *.py,*.pyw set tabstop=8

" expand tabs into 4 spaces
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4

" allow use of < and > to indent or unindent blocks in visual mode
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4

au BufRead,BufNewFile *.py set syntax=python

" full syntax highlighting
let python_highlight_all=1
set syntax=on
filetype on

" automatically indent based on file type
filetype indent on

" automaticaly enuble plugin by file type
filetype plugin on

" Json
au! BufRead,BufNewFile *.json setfiletype json

" get rid of vi compatible keys
set nocompatible

" switch between buffere
" without saving them
set hidden

" always show tab bar, even when not in use,
" to remind me to use it instead of buffers
set showtabline=2

" syntax highlighting on
syntax on

" highlight bad whitespace
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
match BadWhitespace /\s\+$/

" use pastel colors because my terminal background is dark
set background=dark

" show line numbers and percentages when scrolling around
set ruler
