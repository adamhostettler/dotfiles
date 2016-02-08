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
Plugin 'atelierbram/vim-colors_duotones'
Plugin 'mileszs/ack.vim'

call vundle#end()
filetype plugin indent on
syntax on
" }}}

" Misc {{{
set modelines=1
set nocompatible
set noswapfile  "don't use swapfile
set laststatus=2  "statusbar on all splits
" }}}

" Spaces & Tabs {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smarttab
set shiftround
"set copyindent
"set preserveindent
set smartindent
" }}}

" Color {{{
syntax enable
let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid
" }}}

" Font {{{
let g:airline_powerline_fonts = 1
set guifont=Fira\ Mono\ for\ Powerline:h14
set linespace=4
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
let g:ackprg = 'ag --vimgrep'
" }}}

" Key Timeouts {{{
set timeoutlen=700
set ttimeoutlen=50
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

" Autogroups {{{
augroup configgroup
	autocmd!
	autocmd FileType python setlocal noexpandtab
augroup END
" }}}

" vim:foldmethod=marker:foldlevel=0
