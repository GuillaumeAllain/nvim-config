setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
augroup sandwich-ft-python
    autocmd Filetype python let b:sandwich_magicchar_f_patterns = [
                \   {
                \     'header' : '\<\%(\h\k*\.\)*\h\k*',
                \     'bra'    : '(',
                \     'ket'    : ')',
                \     'footer' : '',
                \   },
                \ ]
augroup END
"lua vim.lsp.enable('ty')
