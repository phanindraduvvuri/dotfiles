let mapleader=" "

" copy to and from the system clipboard
set clipboard+=unnamedplus

" Plugins autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Pluggins
call plug#begin('~/.vim/plugged')

" VSCode dark theme for vim
Plug 'tomasiser/vim-code-dark'

" status bar at the bottom
Plug 'vim-airline/vim-airline'

" theme support for air-line status bar
Plug 'vim-airline/vim-airline-themes'

" file tree for vim
Plug 'preservim/nerdtree'

" toggle/add comments easily
Plug 'tpope/vim-commentary'

Plug 'arcticicestudio/nord-vim'

" icons in nerd tree
Plug 'ryanoasis/vim-devicons'

call plug#end()

"-----------------------------------
"------------ colors ---------------
"-----------------------------------

" set terminal colors
set termguicolors


" set colorscheme
colorscheme nord

" set dark theme
set bg=dark


"------------------------------------
"----------- basic settings ---------
"------------------------------------

set nocompatible
filetype off

" Always show statusline
set laststatus=2

" turn on syntax-highlighting
syntax enable

" set side number (relative numbers)
set number relativenumber

" highlight current cursor line and cursor column
set cursorline

set noshowmode

" use spaces instead of tabs
set expandtab

" Set smart tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" case insensitive search
set ignorecase
set smartcase

" turn on mouse function
set mouse=a

" add daughter files and folders to vim path
set path+=**

" menu at the bottom for commands
set wildmenu

" match partially types words
set incsearch

" no backup file
set nobackup

" no swap file
set noswapfile
"----------------------------
"--------- hotkeys ----------
"----------------------------

" shortcut to save and save&quit commands
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" toggle nerdtree with ctrl + f
nmap <C-f> :NERDTreeToggle<CR>

"-----------------------------
"--------- splits ------------
"-----------------------------

" set the splits corrects
set splitbelow splitright

" fix split nav keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"----------------------------------
"----------- autocmds -------------
"----------------------------------

" open NERDTree automatically
" autocmd VimEnter * NERDTree
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set path+=**
set wildmenu
set incsearch
set nobackup
set noswapfile

set guioptions-=m	"remove menu bar
set guioptions-=T	"remove toolbar
set guioptions-=r	"remove right-hand scroll bar
set guioptions-=L	"remove left-hand scroll bar

" function to clear unwanted spaces
function! ClearExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre * :call ClearExtraSpaces()

" Vertically center document when enter insert mode
autocmd InsertEnter * norm zz

" ===> Remap Esc to ii
:imap ii <Esc>

autocmd BufNewFile,BufRead * try
autocmd BufNewFile,BufRead * set encoding=utf-8
autocmd BufNewFile,BufRead * endtry

scriptencoding utf-8
set encoding=utf-8

"-----------------------------
"-----------aliases-----------
"-----------------------------

" alias 'S' to global search and replace
nnoremap S :%s//gIc<left><left><left><left>

