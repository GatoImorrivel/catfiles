" term
set title

" chars
set encoding=utf-8
set emoji

" move and search stuff
set incsearch
set magic
set ignorecase
set smartcase

" identation
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" swap tomfoolery
set directory=$HOME/vimswp//
set noswapfile

" mouse
set mouse=a

" text display
set number
set relativenumber
set nowrap
set linebreak
set scrolloff=3
set sidescrolloff=5

" syntax
syntax enable
set nospell
set spelllang=en
set t_Co=256
set nocursorline
filetype plugin indent on
filetype indent on
set hlsearch
set termguicolors

" gui
set guifont=Symbols\ Nerd\ Font:h14

" keybindings
let mapleader = "\<Space>"
inoremap <c-J> <esc>
inoremap jk <esc>
inoremap kj <esc>

nnoremap ; :

nmap <leader>e <Cmd>CocCommand explorer<CR>



" plugin tomfoolery beings
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' } 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'

call plug#end()
" plugin tomfoolery ends

colorscheme dracula

let g:airline_symbols_ascii = 1
