vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.cmd.iabbrev("<buffer>", "oeil", "œil")
vim.cmd.iabbrev("<buffer>", "Oeil", "Œil")
for _, k in ipairs({ "j", "k" }) do
    vim.keymap.set({ "n", "x" }, k, "g" .. k, { buffer = true })
end
