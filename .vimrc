" Vundle {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/base16-vim'

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
let base16colorspace=256
"let g:hybrid_use_Xresources = 1
set background=dark
colorscheme base16-paraiso
" }}}

" Font {{{
"let g:airline_powerline_fonts = 1
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

" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'seoul256',
	  \ 'active': {
	  \   'left': [ [ 'mode', 'paste' ],
	  \				[ 'fugitive', 'readonly', 'filename', 'modified' ] ]
	  \ },
	  \ 'component': {
	  \	  'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	  \ },
	  \ 'component_visible_condition': {
	  \	  'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
	  \ }
      \ }
" }}}

" Airline {{{
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = '"\ua0"'
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
