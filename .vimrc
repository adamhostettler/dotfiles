" Adam Hostettler

" Misc {{{
set modelines=1
set nocompatible
set noswapfile  "don't use swapfile
set laststatus=2  "statusbar on all splits
" }}}

" Spaces & Tabs {{{
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
"set smartindent
"set shiftround
" }}}

" Color {{{
syntax enable
let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid
" }}}

" Font {{{
let g:airline_powerline_fonts = 1
set guifont=Droid\ Sans\ for\ Powerline
" }}}

" UI Layout {{{
set number
set cursorline
set nowrap
set wildmenu
" }}}

" Searching {{{
set incsearch
set hlsearch
" }}}

" Key Timeouts {{{
set timeoutlen=700
set ttimeoutlen=50
" }}}

" Vundle {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'w0ng/vim-hybrid'

call vundle#end()
filetype plugin indent on
syntax on
" }}}

" Airline {{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" }}}

" Remappings {{{
noremap <cr> :
nnoremap ; :
nmap <leader>t :TagbarToggle<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
