set nocompatible

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
set noshowmode

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
set showtabline=2

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
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'alvan/vim-closetag'

call plug#end()
" plugin tomfoolery ends

" ALE
let g:ale_linters = {
        \ 'typescript': ['prettier'],
        \ 'javascript': ['eslint'],
        \ 'c': [],
        \ 'cpp': []
        \}
let g:ale_fix_on_save = 1

" js
let g:javascript_plugin_jsdoc = 1

" auto close tags
let g:closetag_filenames = '*.blade.php,*.html,*.xhtml,*.xml,*.js,*.jsx,*.tsx,*.html.erb,*.md'
let g:closetag_xhtml_filenames = '*.js,*.jsx,*.tsx'

" denite
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" use <tab> for trigger completion
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

" use <C-S> to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" colors
set background=dark
colorscheme dracula
let g:airline_theme = 'dracula'

let g:airline_symbols_ascii = 1
