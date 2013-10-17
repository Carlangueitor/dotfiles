" Author: Charly Román                                                       "
" Twitter: @Carlangueitor                                                    "
" URL: http://github.com/Carlangueitor/vim-config                            "
"                                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GENERAL CONFIG "
""""""""""""""""""

syntax on
colorscheme molokai
set nocompatible
set number
set nowrap
set cursorline
set t_Co=256
set encoding=utf-8
set mouse=a
set guifont=Source\ Code\ Pro\ Semibold\ 13
set colorcolumn=80
filetype off
filetype plugin indent on
filetype plugin on
highlight ColorColumn ctermbg=234
" Higlight current column.
au WinLEave * set nocursorcolumn
au WinEnter * set cursorcolumn


" VUNDLE CONFIG "
"""""""""""""""""

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
" Plugins
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rosenfeld/conque-term'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/Pydiction'
Bundle 'AutoComplPop'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'tristen/vim-sparkup'
Bundle 'jelera/vim-javascript-syntax'


" POWERLINE CONFIG "
""""""""""""""""""""


python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2
set noshowmode
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 0

" TYPING "
""""""""""

" Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set ai
set si

" Autocomplete
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap ' ''<Esc>:let leavechar="'"<CR>i
inoremap " ""<Esc>:let leavechar='"'<CR>i

" WINDOWS & TABS "
""""""""""""""""""

nmap <C-w-Left> <C-w-h>
nmap <C-w-Right> <C-w-l>
nmap <C-t> :tabnew<CR> 

" NERDTREE "
""""""""""""

nmap <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']


" TAGBAR "
""""""""""
nmap <F4> :TagbarToggle<CR>
vmap <F4> :TagbarToggle<CR>

" Syntastic "
"""""""""""""

" Python
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args= "--ignore=E501,E124,E128"
" Javascript
let g:syntastic_javascript_checkers = ['jshint']

" FILES & SAVING "
""""""""""""""""""

set nobackup
set noswapfile
set autoread

" Ignore files in mru
set wildignore+=*.pyc,*.pyo

" Error navigation.
nmap tt :lnext<CR>
nmap rr :lprev<CR>

" Pydiction "
"""""""""""""
let g:pydiction_location = "~/.vim/bundle/Pydiction/complete-dict"

autocmd FileType python set omnifunc=pythoncomplete#Complete

" Session "
"""""""""""
let g:session_autosave='no'
