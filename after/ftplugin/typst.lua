vim.cmd.setlocal("expandtab")
vim.cmd.setlocal("shiftwidth=4")
vim.cmd.iabbrev("oeil", "œil")
vim.cmd.iabbrev("Oeil", "Œil")

vim.cmd([[
vnoremap j gj
vnoremap k gk
nnoremap j gj
nnoremap k gk
]])
