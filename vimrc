let $PYTHONHOME='/usr/local/bin/python'
" Stuff i want to remember:
"
" comment out all lines containing log or Log
" :g/log\|Log/s/^/#/g
"
" comment out a visually selected block
" s/^/#
"
" uncomment a visually selected block
" s/^#//
"
" remove all the ^M in a file
" :%s/\ r//g
"
" remove all the ^M in a file (that are at the end of lines)
" :%s/\ r$//g
"
":%s//joe/igc substitute your last search with joe.
"
"
"To change two vertically split windows to horizonally split
"
"    ^Wt^WK
"Horizontally to vertically:
"
"        ^Wt^WH



" set terminal title to file title
"set title

" change into directory of current buffer so :e is always relative to current
" file
"set autochdir

" enable pathogen
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" Disable python folding
let g:pymode_folding = 0

" disable word wrap
set nowrap

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Show menu with possible tab completions
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmode=list:full

" ignore case when searching (see smartcase)
set ignorecase

" do not ignore case if pattern has mixed case (see ignorecase)
set smartcase

" round alignment to nearest indent when shifting with < and >
set shiftround

" save buffers
set autowrite

" turn off backup, swps
set nobackup
set nowb
set noswapfile

" auto load files if vim detects they have been changed outside of Vim
set autoread

" keep indentation from previous line
"set autoindent

" smartindent after beginning a block
set smartindent
au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" set tabs to eight characters wide
" http://docs.python.org/reference/lexical_analysis.html#indentation
au BufRead,BufNewFile *.py,*.pyw setlocal tabstop=8

" expand tabs into 4 spaces
au BufRead,BufNewFile *.py,*.pyw setlocal expandtab
au BufRead,BufNewFile *.py,*.pyw setlocal softtabstop=4

" allow use of < and > to indent or unindent blocks in visual mode
au BufRead,BufNewFile *.py,*.pyw setlocal shiftwidth=4

au BufRead,BufNewFile *.py setlocal syntax=python

" full syntax highlighting
let python_highlight_all=1

" automatically indent based on file type
filetype indent on

" automaticaly enable plugin by file type
filetype plugin on

" get rid of vi compatible keys
set nocompatible

" now that i'm using homebrew's vim (instead of osx' or homebrew's macvim),
" need to map the delete key to my preferred behavior.
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
func Backspace()
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    return "\<Left>\<Del>"
  endif
endfunc

inoremap <BS> <c-r>=Backspace()<CR>

" switch between buffers
" without saving them
set hidden

" always show tab bar, even when not in use,
" to remind me to use it instead of buffers
set showtabline=2

" highlight bad whitespace
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
autocmd FileType python match BadWhitespace /^\t\+/

" Don't left align comments in Python mode.
autocmd FileType python set cinoptions+=#1 cinkeys-=0#

" Make trailing whitespace be flagged as bad.
match BadWhitespace /\s\+$/

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"remove all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html setlocal sw=2
autocmd FileType html setlocal ts=2
autocmd FileType html setlocal sts=2
autocmd FileType html setlocal textwidth=0
autocmd FileType html setlocal expandtab
" http://morearty.com/blog/2013/01/22/fixing-vims-indenting-of-html-files.html
autocmd FileType html setlocal indentkeys-=*<Return>

" XHTML (tab width 2 chr, no wrapping)
autocmd FileType xhtml setlocal sw=2
autocmd FileType xhtml setlocal ts=2
autocmd FileType xhtml setlocal sts=2
autocmd FileType xhtml setlocal textwidth=0
autocmd FileType xhtml setlocal expandtab

" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css setlocal sw=2
autocmd FileType css setlocal ts=2
autocmd FileType css setlocal sts=2
autocmd FileType css setlocal textwidth=79
autocmd FileType css setlocal expandtab

" treat json like js
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" JavaScript (tab width 2 chr, wrap at 79th)
autocmd FileType javascript setlocal sw=2
autocmd FileType javascript setlocal ts=2
autocmd FileType javascript setlocal sts=2
autocmd FileType javascript setlocal textwidth=79
autocmd FileType javascript setlocal expandtab
let javascript_enable_domhtmlcss=1

" Python
autocmd FileType python setlocal  textwidth=79
autocmd FileType python setlocal  colorcolumn=80


" use pastel colors because my terminal background is dark
set background=dark
colorscheme solarized

" show line numbers and percentages when scrolling around
set ruler
set number

" fix slight delay after pressing ESC then O
" https://github.com/jackfranklin/dotfiles/blob/master/.vimrc#L159
set timeout timeoutlen=1000 ttimeoutlen=100
