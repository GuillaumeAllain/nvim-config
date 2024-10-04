vim.keymap.set(
    "n",
    "<leader>bb",
    "<cmd>silent w|lua require('harpoon.term').sendCommand(1,'builder '..vim.fn.fnameescape(vim.fn.expand('%:p'))..'\\r')<cr>",
    { noremap = true, silent = true, desc = "Use HarpoonTerm to call system's file builder" }
)
vim.keymap.set(
    "n",
    "<leader>bl",
    "<cmd>silent w|lua require('harpoon.term').sendCommand(1,'!!\\r')<cr>",
    { noremap = true, silent = true, desc = "Build last command in HarpoonTerm" }
)
vim.keymap.set(
    "n",
    "<leader>bo",
    "<cmd>silent w|lua require('harpoon.term').sendCommand(1,'opener '..vim.fn.fnameescape(vim.fn.expand('%:p'))..'\\r')<cr>",
    { noremap = true, silent = true, desc = "Use HarpoonTerm to call system's file opener" }
)
vim.keymap.set(
    "n",
    "<leader>bc",
    "<cmd>silent w|lua require('harpoon.term').sendCommand(1,'cleaner '..vim.fn.fnameescape(vim.fn.expand('%:p'))..'\\r')<cr>",
    { noremap = true, silent = true, desc = "Use HarpoonTerm to call system's file cleaner" }
)
vim.keymap.set(
    "i",
    "<C-b>",
    "<cmd>lua require('telescope').extensions.bibtex.bibtex({format='markdown'})<cr>",
    { noremap = true, silent = true, desc = "bibtex" }
)

vim.keymap.set("n", "<leader>gg", "<cmd>lua require('trouble').focus()<cr>")

function _G.tabout_binding()
    require("tabout")
    if vim.fn.pumvisible() ~= 0 then
        return vim.api.nvim_replace_termcodes("<C-l>", true, true, true)
    elseif vim.fn["vsnip#available"](1) ~= 0 then
        return vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true)
    else
        return vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true)
    end
end

vim.api.nvim_set_keymap("i", "<C-L>", "v:lua.tabout_binding()", { silent = true, expr = true })
