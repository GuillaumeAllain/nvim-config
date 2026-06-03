require("trouble").setup({})

vim.keymap.set("n", "<leader>gh", "<cmd>Trouble toggle diagnostics <CR>", { desc = "TroubleToggle" })
vim.keymap.set("n", "<leader>gj", "<cmd>Trouble toggle todo <CR>", { desc = "TodoTrouble" })
vim.keymap.set("n", "<leader>gg", function()
    require("trouble").focus()
end, { desc = "Focus Trouble" })
