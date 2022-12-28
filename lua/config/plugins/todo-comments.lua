return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            highlight = {
                comments_only = false,
            },
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = vim.g["terminal_color_2"], -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = " ", color = vim.g["terminal_color_6"], alt = { "À faire" } },
                HACK = { icon = " ", color = vim.g["terminal_color_2"] },
                WARN = { icon = " ", color = vim.g["terminal_color_3"], alt = { "WARNING", "XXX" } },
                PERF = {
                    icon = " ",
                    color = vim.g["terminal_color_3"],
                    alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
                },
                NOTE = { icon = " ", color = vim.g["terminal_color_5"], alt = { "NOTE" } },
                -- DONE = { icon = " ", color = vim.g["terminal_color_5"], alt = { "DONE" } },
            },
        })
    end,



}
