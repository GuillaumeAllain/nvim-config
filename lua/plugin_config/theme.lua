-----------------------------THEME------------------------------
vim.cmd[[let &fcs='eob: ']]
vim.cmd[[set termguicolors]]
vim.cmd[[set noshowmode]]

-- vim.cmd[[hi Normal guibg=none ctermbg=none]]
--
vim.cmd[[hi LineNr guibg=none ctermbg=none]]
vim.cmd[[hi Folded guibg=none ctermbg=none]]
vim.cmd[[hi NonText guibg=none ctermbg=none]]
vim.cmd[[hi SpecialKey guibg=none ctermbg=none]]
vim.cmd[[hi VertSplit guibg=none ctermbg=none]]
vim.cmd[[hi SignColumn guibg=none ctermbg=none]]
vim.cmd[[hi EndOfBuffer guibg=none ctermbg=none]]

vim.cmd[[au Colorscheme * hi! link Conceal Number]]
vim.cmd[[au Colorscheme * hi link FoldColumn Normal]]
