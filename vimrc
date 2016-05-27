"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               VIM Config                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintained by Charly Román <charly@croman.mx>                               "
" Compatible with Mac & Linux                                                 "
" Part of dotfiles: https://github.com/Carlangueitor/dotfiles                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General {{{
set nocompatible  " Be Improved
set nowrap

filetype plugin indent on
" }}}

" Bundle {{{
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand("~/.vim/bundle"))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'zenorocha/dracula-theme', {'rtp' : 'vim'}

call neobundle#end()
NeoBundleCheck
"}}}

"GUI {{{
syntax on
colorscheme dracula

set number
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set laststatus=2
set colorcolumn=80

let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

if has("gui_running")
  if has("gui_macvim")
    set guifont=Source\ Code\ Pro\ Medium:h18
  else
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Semibold\ 11
  endif
endif
"}}}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set nobackup
set noswapfile
set autoread

au FileType html setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType html.mustache setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType html.handlebars setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType javascript setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType json setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType python setl tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
au FileType yaml setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab

inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap ' ''<Esc>:let leavechar="'"<CR>i
inoremap " ""<Esc>:let leavechar='"'<CR>i
