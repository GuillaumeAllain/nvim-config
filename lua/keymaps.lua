vim.cmd([[
    nnoremap <leader><leader> <c-^>

    nnoremap H ^
    nnoremap L $
    vnoremap H ^
    vnoremap L $

    noremap <expr> (search-forward) 'Nn'[v:searchforward]
    noremap <expr> (search-backward) 'nN'[v:searchforward]

    nmap n (search-forward)zzzv
    xmap n (search-forward)zzzv

    nmap N (search-backward)zzzv
    xmap N (search-backward)zzzv

    imap <escape> <C-\><C-n>
    tnoremap <Esc><Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc
    nnoremap <C-p> <C-]>
]])
-- nnoremap c "_c

-- nnoremap <leader>h <C-\><C-N><cmd>bp <CR>
-- nnoremap <leader>l <C-\><C-N><cmd>bn <CR>
