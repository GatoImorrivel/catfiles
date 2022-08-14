let mapleader = "\<Space>"
inoremap <c-J> <esc>
inoremap jk <esc>
inoremap kj <esc>

nnoremap ; :

nmap <leader>e <Cmd>CocCommand explorer --preset floating<CR>

" use <C-S> to save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" CoC

  " use <tab> for trigger completion
  inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

  " space to trigger autocomplete
  inoremap <silent><expr> <c-space> coc#refresh()

" Denite
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Prettier
vmap <leader>f  :Prettier<CR>
nmap <leader>f  :Prettier<CR>
