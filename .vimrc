set nocompatible
"set relativenumber
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

syntax enable
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bitc/vim-bad-whitespace'

call vundle#end()

filetype plugin indent on
syntax on

set background=light
colorscheme solarized 

set scrolloff=3

let g:NERDTreeIgnore=['.pyc$[[file]]','__init__.py','.egg-info$']

" toggle nerdtree
map <C-n> :NERDTreeToggle<CR>
