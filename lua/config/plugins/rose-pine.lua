return {
    "rose-pine/neovim",
    lazy = false,
    priority = 10000,
    enabled=false,
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            -- dark_variant = "moon",
            disable_background = true,
            disable_float_background = true,
            highlight_groups = {
                -- Folded = { link = "Comment" },
                -- -- FloatBorder =  {fg = "iris"},
                -- StatusLine = { fg = "text", bg = "None" },
                -- TelescopePromptBorder = {link="Normal"},
                -- TelescopeBorder = {link="Normal"},
                -- FoldColumn = { link = "Normal" },
                StatusLine = { bg = "None" },
                StatusLineNC = { bg = "None" }
            },
        })
        vim.opt.background = "dark"
        vim.cmd.colorscheme("rose-pine")

        -- local float_bg = require("rose-pine.palette").surface
        --
        -- require("config.vim-theme").config({ float_bg = float_bg })
    end,
}
