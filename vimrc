syntax on

" Case-insensitive search
set ignorecase

" Line numbering
set number relativenumber

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4

" File type based indentation
filetype plugin indent on

set colorcolumn=80

set clipboard=unnamedplus

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural splitting
set splitbelow
set splitright

let g:vimwiki_list = [{'path': '~/wiki/'}]

" Plugins
call vundle#begin()

Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'vimwiki/vimwiki'
Plugin 'dylanaraps/wal'

call vundle#end()

colorscheme wal
