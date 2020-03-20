" Case-insensitive search
set ignorecase

" Line numbering
set number relativenumber

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural splitting
set splitbelow
set splitright

" Syntax folding, start unfolded
set foldmethod=syntax
set nofoldenable

" Miscellaneous general config
syntax on

autocmd BufNewFile,BufRead *.hcl :setlocal filetype=terraform
autocmd BufNewFile,BufRead *.tf :setlocal filetype=terraform

set timeoutlen=1000 ttimeoutlen=0
set colorcolumn=81
set clipboard=unnamedplus

filetype plugin indent on

runtime macros/matchit.vim

" NERDTree config
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=24

nnoremap <C-n> :NERDTreeToggle<CR>

autocmd FileType nerdtree setlocal number relativenumber

" Taboo config
let g:taboo_tab_format = " %N %f "
let g:taboo_renamed_tab_format = " %N %l "

nnoremap <Leader>t :TabooRename<space>

" Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'x', 'z', 'error', 'warning' ]
  \ ]

let g:airline_section_z = '%3l/%L:%3v'

" fzf config
let g:fzf_layout = { 'down': '~15%' }
let g:fzf_buffers_jump = 1

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>

" Word processor mode
func! WordProcessorMode()
    setlocal noexpandtab
    map j gj
    map k gk
    setlocal linebreak
    set colorcolumn=0
endfu
com! WP call WordProcessorMode()

" Plugins
call vundle#begin()

Plugin 'hashivim/vim-terraform'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'gcmt/taboo.vim'
Plugin 'w0rp/ale'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dylanaraps/wal'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'dracula/vim', {'name': 'dracula'}

call vundle#end()

colorscheme wal
