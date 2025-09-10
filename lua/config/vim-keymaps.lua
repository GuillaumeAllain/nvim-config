vim.cmd([[
    nnoremap <leader><leader> <c-^>

    nnoremap H ^
    nnoremap L $
    vnoremap H ^
    vnoremap L $
    nnoremap <C-o> <C-o>zz

    noremap <expr> (search-forward) 'Nn'[v:searchforward]
    noremap <expr> (search-backward) 'nN'[v:searchforward]

    nmap n (search-forward)zzzv
    xmap n (search-forward)zzzv

    nmap N (search-backward)zzzv
    xmap N (search-backward)zzzv
    vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

    imap <escape> <C-\><C-n>
    tnoremap <Esc><Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    tnoremap <C-k> <C-\><C-n><C-w>w
    nnoremap <C-p> <C-]>
    "inoremap <c-k> <Esc>vib<Esc>%%a
    "nnoremap <c-k> <Esc>vib<Esc>%%a

    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap [ [<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u
]])

-- vnoremap <silent> <c-j> :m '>+1<CR>gv=gv
-- vnoremap <silent> <c-k> :m '<-2<CR>gv=gv
-- nnoremap c "_c
-- nnoremap <leader>h <C-\><C-N><cmd>bp <CR>
-- nnoremap <leader>l <C-\><C-N><cmd>bn <CR>
