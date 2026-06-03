-- vim-table-mode (vimscript plugin; already sourced by vim.pack.add).
require("which-key").add({
    { "<leader>t", group = "table mode" },
})
vim.cmd([[let g:table_mode_map_prefix = '<Leader>tm']])
