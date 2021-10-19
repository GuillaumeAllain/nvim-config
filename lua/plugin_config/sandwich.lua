vim.cmd([[
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
  \   {
  \ '__filetype__': 'pandoc',
  \     'buns': ['{', '}'],
  \     'cursor': 'head',
  \     'command': ['startinsert'],
  \     'kind': ['add', 'replace'],
  \     'action': ['add'],
  \     'input': ['f']
  \   },
  \ ]
let g:sandwich#recipes += [
  \   {
  \ '__filetype__': 'tex',
  \     'buns': ['{', '}'],
  \     'cursor': 'head',
  \     'command': ['startinsert'],
  \     'kind': ['add', 'replace'],
  \     'action': ['add'],
  \     'input': ['f']
  \   },
  \ ]
]])
