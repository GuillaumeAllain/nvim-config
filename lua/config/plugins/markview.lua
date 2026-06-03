require("markview").setup({
    modes = { "n", "i", "no", "c" },
    hybrid_modes = { "i", "n" },
    checkboxes = require("markview.presets").checkboxes.nerd,
    ignore_buftypes = {},
    preview = {
        hybrid_modes = { "i" },
        modes = { "i", "n", "no", "v", "c" },
        filetypes = { "markdown", "quarto", "rmd", "pandoc", "codecompanion" },
        icon_provider = "internal",
    },
})
require("markview.extras.editor").setup()
vim.api.nvim_create_autocmd("FileType", {
    pattern = "codecompanion",
    callback = function(ev)
        require("markview.actions").attach(ev.buf)
    end,
})

vim.keymap.set("n", "<leader>pm", function()
    vim.cmd("Markview toggle")
    Snacks.image.hover()
end, { desc = "Toggle Markview" })
