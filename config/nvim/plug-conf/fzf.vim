nmap <leader>p :Files<CR>
vmap <leader>p :Files<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'window': 'call CreateCenteredFloatingWindow()'}

let $FZF_DEFAULT_OPTS = '--reverse'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!{node_modules,.git}'"

" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=CursorLine:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 1
    let opts.width -= 2
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction
