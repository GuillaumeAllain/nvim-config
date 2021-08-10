vim.cmd([[
nnoremap <leader>h <C-\><C-N><cmd>bp <CR>
nnoremap <leader>l <C-\><C-N><cmd>bn <CR>

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

noremap <expr> (search-forward) 'Nn'[v:searchforward]
noremap <expr> (search-backward) 'nN'[v:searchforward]

nnoremap <leader>gd "dyiw:lua require\'utils\'.macdict(vim.fn.getreg(\'d\'))<CR>
vnoremap <leader>gd "dy:lua require\'utils\'.macdict(vim.fn.getreg(\'d\'))<CR>

nmap n (search-forward)zzzv
xmap n (search-forward)zzzv

nmap N (search-backward)zzzv
xmap N (search-backward)zzzv

imap <escape> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <M-[> <Esc>
tnoremap <C-v><Esc> <Esc
nnoremap c "_c
nnoremap <C-p> <C-]>
]])

