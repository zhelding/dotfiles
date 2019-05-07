syntax on

" Case-insensitive search
set ignorecase

" Line numbering
set number relativenumber

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4

set timeoutlen=1000 ttimeoutlen=0

" File type based indentation
filetype plugin indent on

set colorcolumn=81

set clipboard=unnamedplus

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural splitting
set splitbelow
set splitright

let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal number relativenumber

autocmd FileType tf,yaml setlocal tabstop=2 shiftwidth=2

map <C-n> :NERDTreeToggle<CR>

let g:taboo_tab_format = " %N %f "
let g:taboo_renamed_tab_format = " %N %l "
nnoremap T :TabooRename

let g:vimwiki_list = [{'path': '~/wiki/'}]
nnoremap <Leader>we :VimwikiAll2HTML <CR>

let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'}

let g:fzf_layout = { 'down': '~15%' }

let g:fzf_buffers_jump = 1

" fzf shortcuts
nnoremap F :Files<CR>
nnoremap B :Buffers<CR>
nnoremap L :Lines<CR>

let b:surround_{char2nr('r')} = "{{ \r }}"

" Plugins
call vundle#begin()

Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'gcmt/taboo.vim'
Plugin 'w0rp/ale'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vimwiki/vimwiki'
Plugin 'dylanaraps/wal'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'

call vundle#end()

colorscheme wal
