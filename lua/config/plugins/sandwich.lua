-- vim-sandwich (vimscript; sourced by vim.pack.add). The recipes reference
-- g:sandwich#default_recipes, which only exists after the plugin is sourced,
-- so this must run in the setup phase (it does).
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
