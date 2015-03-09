"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/charly/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/charly/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'zenorocha/dracula-theme', {'rtp' : 'vim'}


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax on
colorscheme dracula

set number
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set laststatus=2
set colorcolumn=80

let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set nobackup
set noswapfile
set autoread

au FileType javascript setl tabstop=2 softtabstop=2 shiftwidth=2
au FileType json setl tabstop=2 softtabstop=2 shiftwidth=2
au FileType yaml setl tabstop=2 softtabstop=2 shiftwidth=2
au FileType html setl tabstop=2 softtabstop=2 shiftwidth=2

inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap ' ''<Esc>:let leavechar="'"<CR>i
inoremap " ""<Esc>:let leavechar='"'<CR>i
