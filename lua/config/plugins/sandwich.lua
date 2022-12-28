return {
    "machakann/vim-sandwich",
    lazy=false,
    config = function()
        vim.cmd([[
        let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
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
        end
    }
