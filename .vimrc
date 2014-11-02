""""""""" ANYTHING!

" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

syntax on
" increase scanlines for syntax highlighting
syntax sync minlines=300
set history=700
set pastetoggle=<F2>

" Enable filetype plugin
filetype on
filetype plugin indent on

" enable spelling
:setlocal spell spelllang=en_us

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"highlight clear StatusLine
"highlight clear TabLineFill
" Use the below highlight group when displaying bad whitespace is desired.
set hlsearch

set nonumber
set complete+=t
set formatoptions-=t
set nonumber
"setlocal nowrap
"setlocal textwidth=80
let g:solarized_termcolors=256
colorscheme solarized
" persistent undo (foreach boot, anyway)
set undofile
set undodir=$TEMP

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "10  :  save up 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"00,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

highlight clear SpellBad
highlight clear BadWhitespace
highlight clear VertSplit
highlight BadWhitespace ctermbg=red guibg=red
highlight SpellBad cterm=underline ctermfg=darkred
highlight VertSplit term=reverse cterm=underline guifg=grey50 guibg=#c2bfa5

"hi clear SpellCap
"hi clear SpellRare
"hi clear SpellLocal
"hi SpellBad term=standout ctermfg=red cterm=bold ctermfg=7 ctermbg=1 guifg=White guiBg=Red
"hi SpellCap term=standout ctermfg=red cterm=bold ctermfg=7 ctermbg=1 guifg=White guiBg=Red
"hi SpellRare term=standout ctermfg=red cterm=bold ctermfg=7 ctermbg=1 guifg=White guiBg=Red
"hi SpellLocal term=standout ctermfg=red cterm=bold ctermfg=7 ctermbg=1 guifg=White guiBg=Red


""""""""" Python !

" For full syntax highlighting:
let python_highlight_all=1

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*pyw set tabstop=4
au BufRead,BufNewFile *.py,*pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
"au BufRead,BufNewFile *.py,*.pyw set autoindent

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufRead,BufNewFile *.py,*.pyw set textwidth=79

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw set fileformat=unix

" my employer defines 100-column limit
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%101v', 100)

""""""""" JSON +
au BufRead,BufNewFile *.json set shiftwidth=2
au BufRead,BufNewFile *.json set tabstop=2
au BufRead,BufNewFile *.json set softtabstop=2
au BufRead,BufNewFile *.json set expandtab
"
""""""""" C !

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *.c,*.h set tabstop=8

au BufRead,BufNewFile *.c,*.h call Select_c_style()
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el 
        set shiftwidth=4
        set expandtab
    en
endf

au BufRead,BufNewFile Makefile* set noexpandtab

au BufRead,BufNewFile *.c,*.h set textwidth=79

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
au BufNewFile *.c,*.h set fileformat=unix

" ----------------------------------------------------------------------------
" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

" Set the default file encoding to UTF-8: ``set encoding=utf-8``

" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


" List of disabled pep8 warnings and errors:
let g:khuno_ignore="E501"  " ,W293

