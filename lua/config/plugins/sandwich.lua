return {
    "machakann/vim-sandwich",
    lazy = true,
    keys = {'sa', 'sd', 'sr', 'sdb', 'srb'},
    event = "VeryLazy",
    config = function()
        vim.cmd([[
        let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
        let g:sandwich#recipes += [
        \   {
            \ 'filetype': ['codevlisp'],
            \     'buns': ['(', ')'],
            \     'cursor': 'inner_head',
            \     'command': ['startinsert'],
            \     'kind': ['add', 'replace'],
            \     'action': ['add'],
            \     'input': ['f']
            \   },
            \ ]
        let g:sandwich#recipes += [
        \   {
            \ 'filetype': ['pandoc'],
            \     'buns': ['{', '}'],
            \     'cursor': 'head',
            \     'command': ['startinsert'],
            \     'kind': ['add', 'replace'],
            \     'action': ['add'],
            \     'input': ['f']
            \   },
            \ ]
            ]])
    end,
}
