return {
    { "markonm/traces.vim",        keys = { ":", "/", "?" } },
    { "zerowidth/vim-copy-as-rtf", cmd = { "CopyRTF" } },
    { "romainl/vim-cool",          lazy = false },
    { "wellle/targets.vim",        lazy = false },
    { "tpope/vim-eunuch",          lazy = false },
    -- {
    --     "xiyaowong/transparent.nvim",
    --     lazy = false,
    --     config = function()
    --         require("transparent").setup({
    --             exclude_groups = { "Visual" },
    --             extra_groups = {
    --                 "TelescopeBorder",
    --                 "Telescope Normal",
    --                 "TelescopePromptNormal",
    --                 "TelescopePromptBorder",
    --                 "Conceal",
    --                 "Comment",
    --             },
    --         })
    --     end,
    -- },
    {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup({ default_keybindings = false })
        end,
    },
    { "MunifTanjim/nui.nvim",    lazy = false },
    {
        "moll/vim-bbye",
        cmd = { "Bdelete", "Bwipeout" },
    },
    { "dkarter/bullets.vim",     ft = { "markdown", "pandoc", "tex" } },
    { "psliwka/termcolors.nvim", cmd = "TermcolorsShow" },
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
    },
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "vim-pandoc/vim-pandoc-syntax",
        ft = { "pandoc" },
        config = function()
            -- vim.g["pandoc#syntax#conceal#cchar_overrides"] = { atx = "#" }
            vim.g["pandoc#modules#disabled"] = { "folding" }
            vim.g["pandoc#filetypes#handled"] = { "pandoc", "markdown" }
            vim.g["pandoc#syntax#style#use_definition_lists"] = 0
            vim.g["pandoc#syntax#conceal#blacklist"] =
            { "atx", "block", "list", "newline", "dashes", "ellipses", "quotes" }
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        cmd = { "Gitsigns" },
        event = { "BufReadPost", "FileReadPost" },
        -- lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup({
                signcolumn = false,
                numhl = false,
                -- _signs_staged_enable = true,
            })
            local function get_color(group, attr)
                local fn = vim.fn
                return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
            end
            vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = get_color("GitSignsAdd", "fg"), bg = "none" })
            vim.api.nvim_set_hl(0, "GitSignsChange", { fg = get_color("GitSignsChange", "fg"), bg = "none" })
            vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = get_color("GitSignsDelete", "fg"), bg = "none" })
            vim.api.nvim_set_hl(
                0,
                "GitSignsChangeDelete",
                { fg = get_color("GitSignsChangeDelete", "fg"), bg = "none" }
            )
        end,
    },
    {
        "dhruvasagar/vim-table-mode",
        ft = { "markdown", "pandoc", "tex" },
        init = function()
            require("which-key").add({
                { "<leader>t", group = "table mode" },
            })
            vim.cmd([[let g:table_mode_map_prefix = '<Leader>tm']])
        end,
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        name = "render-markdown",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
        ft = { "markdown", "pandoc" },
        config = function()
            require("render-markdown").setup({
                file_types = { "markdown", "pandoc" },
            })
        end,
    },
    {
        "heterophyllus/vscode-codev",
        ft = { "codev" },
    },
    {
        "GuillaumeAllain/vim-codevmacro",
        branch = "dev",
        ft = { "codev" },
    },
}
