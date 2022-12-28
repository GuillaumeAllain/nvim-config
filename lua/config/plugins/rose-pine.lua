return {
        "rose-pine/neovim",
        lazy=false,
        priority=1000,
        config = function()
            require("rose-pine").setup({
                dark_variant = "moon",
            })
            vim.cmd.colorscheme("rose-pine")
            local float_bg = require("rose-pine.palette").surface
            require("config.vim-theme").config({ float_bg = float_bg })
        end,
}
