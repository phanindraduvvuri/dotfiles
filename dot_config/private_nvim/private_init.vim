set nocompatible
filetype off

" plugin manager 
call plug#begin()

" Bottom status line
Plug 'itchyny/lightline.vim'

" Color scheme for fish config
Plug 'dag/vim-fish'

" support for languages
Plug 'sheerun/vim-polyglot'

" color css colors
Plug 'ap/vim-css-color'

" file manager inside vim
Plug 'preservim/nerdtree'

call plug#end()


filetype plugin indent on

" lightline settings
let g:lightline = { 'colorscheme': 'onedark' }

" General Settings "

set path+=**
set wildmenu
set incsearch
set hidden
set nobackup
set noswapfile
set t_Co=256
set number relativenumber
set clipboard=unnamedplus
syntax enable
let g:rehash256 = 1

" Remap Keys

" Remap ESC to ii
:imap ii <Esc>

set laststatus=2

set noshowmode

" Text, tab and indent related
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Mouse Scrolling
set mouse=nicr
set mouse=a

" Splits and Tabbed Files

set splitbelow splitright

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" NerdTree shortcuts
nnoremap <C-b> :NERDTreeToggle<CR>

""" NerdTree config

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Removes pipes | that act as separator on splits
set fillchars+=vert:\


let g:python_highlight_all = 1


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

