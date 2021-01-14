let mapleader=" "

" copy to and from the system clipboard
set clipboard+=unnamedplus

" Pluggins
call plug#begin(stdpath('data') . '/plugged')

" status bar at the bottom
Plug 'vim-airline/vim-airline'

" theme support for air-line status bar
Plug 'vim-airline/vim-airline-themes'

Plug 'arcticicestudio/nord-vim'

" preview for hex colors
Plug 'norcalli/nvim-colorizer.lua'

" automatically open menu for autocomplete suggestionas
Plug 'vim-scripts/AutoComplPop'

" file tree for vim
Plug 'preservim/nerdtree'

" toggle/add comments easily
Plug 'tpope/vim-commentary'

" icons in nerd tree
Plug 'ryanoasis/vim-devicons'

" syntax highlight for sxhkd file
Plug 'kovetskiy/sxhkd-vim'

" auto closing bracket insertions
Plug 'jiangmiao/auto-pairs'

" startup screen for vim
Plug 'mhinz/vim-startify'

call plug#end()

"-----------------------------------
"------------ colors ---------------
"-----------------------------------

" set terminal colors
set termguicolors

" hightligh hex colors
lua require'colorizer'.setup()

let g:codedark_colorterm = 0

" set colorscheme
colorscheme nord

"
"-------------------------
"--- airline settings ----
"-------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
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

" highlight current cursor line
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

set wildmode=full
" set wildmode=longest,list,full

set guioptions-=m	"remove menu bar
set guioptions-=T	"remove toolbar
set guioptions-=r	"remove right-hand scroll bar
set guioptions-=L	"remove left-hand scroll bar

"----------------------------
"--------- hotkeys ----------
"----------------------------

" shortcut to save and quit commands
nnoremap <leader>q :q<CR>
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

" set filetypes for unrecognized files
autocmd BufNewFile,BufRead *.rasi set filetype=rasi

"-----------------------------
"-----------aliases-----------
"-----------------------------

" alias 'S' to global search and replace
nnoremap S :%s//gIc<left><left><left><left>

