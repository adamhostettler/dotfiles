set nocompatible
set number
set smartindent
set copyindent
"set cursorline
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set shiftround
set nowrap
set noswapfile
set timeoutlen=50
"set notimeout
"set nottimeout
set laststatus=2
set incsearch
set hlsearch
set noexpandtab

syntax enable
filetype off

" begin vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'

" fix for lavalamp theme
Plugin 'godlygeek/csapprox'

call vundle#end()
filetype plugin indent on
syntax on
" end vundle stuff

" bg & colorscheme
set background=dark
colorscheme sourcerer

" 256 colors fixes
set t_Co=256

let g:airline_powerline_fonts=1
set guifont=Droid\ Sans\ for\ Powerline
"let g:airline_theme='lavalamp'

" remappings
noremap <cr> :
nnoremap ; :
nmap <leader>t :TagbarToggle<CR>

" trying to fix airline things
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
