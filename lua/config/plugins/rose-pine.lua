return {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            dark_variant = "moon",
            disable_background = true,
            disable_float_background=true, 
            highlight_groups = {
                Folded = { link = "Comment" },
                -- FloatBorder =  {fg = "iris"},
                TelescopePromptBorder = {link="Normal"},
                TelescopeBorder = {link="Normal"},
                FoldColumn = { link = "Normal" },
            },
        })
        vim.opt.background = "light"
        vim.cmd.colorscheme("rose-pine")
        -- local float_bg = require("rose-pine.palette").surface
        -- require("config.vim-theme").config({ float_bg = float_bg })
    end,
}
