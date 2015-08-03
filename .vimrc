set nocompatible
set number
set smartindent
set copyindent
set cursorline
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set shiftround
set nowrap
set noswapfile
set timeoutlen=50
set laststatus=2
set incsearch
set hlsearch

syntax enable
filetype off

" begin vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bitc/vim-bad-whitespace'

" fix for lavalamp theme
Plugin 'godlygeek/csapprox'

" colorschemes!
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on
syntax on
" end vundle stuff

" colorscheme and background
set background=dark
colorscheme sourcerer

" 256 colors fixes
set t_Co=256

" NERDTree
let g:NERDTreeIgnore=['.pyc$[[file]]','__init__.py','.egg-info$']
" toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

let g:airline_powerline_fonts=1
set guifont=Droid\ Sans\ for\ Powerline
"let g:airline_theme='lavalamp'

" remappings
let mapleader=','
noremap <cr> :
nnoremap ; :

" trying to fix airline things
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
