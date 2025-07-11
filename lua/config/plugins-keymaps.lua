local default = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>fa", function()
    vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "Code Actions" })
vim.keymap.set("n", "<leader>gl", function()
    require("utils").toggle_build_buffer_window({ vertical = false })
end, vim.tbl_extend("force", default, { desc = "default" }))
vim.keymap.set("n", "<leader>bb", function()
    vim.api.nvim_command("write")
    require("utils").send_command_to_build_terminal("builder " .. vim.fn.fnameescape(vim.fn.expand("%:p")))
end, vim.tbl_extend("force", default, { desc = "build dans term" }))
vim.keymap.set("n", "<leader>bl", function()
    vim.api.nvim_command("write")
    require("utils").send_command_to_build_terminal("!!")
end, vim.tbl_extend("force", default, { desc = "dernière commande" }))
vim.keymap.set("n", "<leader>bo", function()
    vim.api.nvim_command("write")
    require("utils").send_command_to_build_terminal("opener " .. vim.fn.fnameescape(vim.fn.expand("%:p")))
end, vim.tbl_extend("force", default, { desc = "ouvrir dans term" }))
vim.keymap.set("n", "<leader>bc", function()
    vim.api.nvim_command("write")
    require("utils").send_command_to_build_terminal("cleaner " .. vim.fn.fnameescape(vim.fn.expand("%:p")))
end, vim.tbl_extend("force", default, { desc = "clean avec term" }))
vim.keymap.set({ "n", "i" }, "<C-k>", function()
    require("utils").focus_build_buffer_window({ vertical = false })
end, vim.tbl_extend("force", default, { desc = "focus term" }))
-- vim.keymap.set("n", "<leader>s", function()
--     require("utils").open_scratch_buffer({ vertical = true })
-- end, vim.tbl_extend("force", default, { desc = "open scratch buffer" }))

vim.keymap.set("n", "<leader>gg", "<cmd>lua require('trouble').focus()<cr>")

-- vim.keymap.set("n", "<leader>pm", "<cmd>Markview toggle<cr>")

vim.keymap.set("n", "<leader>pm", function()
    vim.cmd("Markview toggle")
    Snacks.image.hover()
end, { desc = "Toggle Markview" })

vim.keymap.set("n", "<leader>d", function()
    require("snacks").bufdelete.delete()
end, { desc = "Delete current buffer" })

function _G.tabout_binding()
    require("tabout")
    if vim.fn.pumvisible() ~= 0 then
        return vim.api.nvim_replace_termcodes("<C-l>", true, true, true)
        -- elseif vim.fn["vsnip#available"](1) ~= 0 then
        --     return vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true)
    else
        return vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true)
    end
end

vim.api.nvim_set_keymap("i", "<C-L>", "v:lua.tabout_binding()", { silent = true, expr = true })
