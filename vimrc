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
set modeline
set modelines=10

filetype off

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
NeoBundle 'zxqfl/tabnine-vim'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'dracula/vim'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'posva/vim-vue'
NeoBundle 'elixir-editors/vim-elixir'
NeoBundle 'othree/xml.vim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'wincent/ferret'
NeoBundle 'ambv/black'
NeoBundle 'iamcco/markdown-preview.nvim'
NeoBundle 'w0rp/ale'
NeoBundle 'floobits/floobits-neovim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
"}}}

"GUI {{{
syntax on
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme dracula

set number
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set laststatus=2
set colorcolumn=80

let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_underline = 1
let g:dracula_colorterm = 1

let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set guifont=Source\ Code\ Pro\ Semibold\ 13
if has("gui_running")
  if has("gui_macvim")
    set guifont=Sauce\ Code\ Powerline:h18

  else
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Semibold\ 11
  endif
endif
"}}}

set incsearch
set ignorecase
set smartcase

let g:ale_completion_enabled = 0
let g:ale_open_list = 1

let g:ale_linters = { 
  \'typescript': ['eslint'],
  \} 

let g:ale_fixers = {
  \'*': ['remove_trailing_lines', 'trim_whitespace'],
  \'javascript': ['prettier'],
  \'typescript': ['prettier'],
  \}

let g:ale_fix_on_save = 1

set nobackup
set noswapfile
set autoread

au BufRead,BufNewFile *.sls setfiletype yaml
au BufWritePre *.py execute ':Black'

set completeopt-=preview
set backspace=indent,eol,start

au FileType css setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType html setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType htmldjango setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType html.mustache setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType html.handlebars setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType javascript setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType typescript setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType json setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType python setl tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
au FileType Jenkinsfile setl tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
au FileType php setl tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
au FileType vue setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType yaml setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType docker-compose setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab
au FileType scss setl tabstop=2 softtabstop=2 shiftwidth=2 smarttab expandtab

let g:session_autosave = 'no'
let g:session_autoload = 'no'
