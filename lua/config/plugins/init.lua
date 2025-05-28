return {
    { "markonm/traces.vim", lazy = true, keys = { ":", "/", "?" } },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disable_mouse = false,
            hints = {
                ["[dcyvV][ia][%(%)]"] = {
                    message = function(keys)
                        return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
                    end,
                    length = 3,
                },
                ["[dcyvV][ia][%{%}]"] = {
                    message = function(keys)
                        return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys
                    end,
                    length = 3,
                },
            },
        },
    },
    { "wellle/targets.vim", lazy = false },
    { "tpope/vim-eunuch",   lazy = false },
    {
        "otavioschwanck/arrow.nvim",
        lazy = false,
        dependencies = {
            { "echasnovski/mini.icons" },
        },
        opts = {
            show_icons = true,
            leader_key = "<leader>r", -- Recommended to be a single key
            mappings = {
                toggle = "w",         -- used as save if separate_save_and_remove is true
            },
            buffer_leader_key = "m",  -- Per Buffer Mappings
        },
    },
    {
        "folke/trouble.nvim",
        opts = {},
        lazy = true,
        cmd = "Trouble",
        keys = {
            {
                "<leader>gh",
                "<cmd>Trouble toggle diagnostics <CR>",
                desc = "TroubleToggle",
            },
            {
                "<leader>gj",
                "<cmd>Trouble toggle todo <CR>",
                desc = "TodoTrouble",
            },
        },
    },
    {
        "vim-pandoc/vim-pandoc-syntax",
        enabled = false,
        event = "VeryLazy",
        lazy = true,
        ft = { "pandoc" },
        config = function()
            vim.g["pandoc#modules#disabled"] = { "folding" }
            vim.g["pandoc#filetypes#handled"] = { "pandoc", "markdown" }
            vim.g["pandoc#syntax#style#use_definition_lists"] = 0
            vim.g["pandoc#syntax#conceal#blacklist"] =
            { "atx", "block", "list", "newline", "dashes", "ellipses", "quotes" }
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        cmd = { "Gitsigns" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup({
                signcolumn = false,
                numhl = false,
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
        lazy = true,
        ft = { "markdown", "pandoc", "tex" },
        config = function()
            require("which-key").add({
                { "<leader>t", group = "table mode" },
            })
            vim.cmd([[let g:table_mode_map_prefix = '<Leader>tm']])
        end,
    },
    {
        "ray-x/yamlmatter.nvim",
        lazy = true,
        ft = { "markdown", "pandoc" },
        config = function()
            require("yamlmatter").setup({})
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        ft = { "markdown", "pandoc" },
        event = "LazyFile",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("markview").setup({
                checkboxes = require("markview.presets").checkboxes.nerd,
                preview = {
                    modes = { "i", "n", "v", "c" },
                    filetypes = { "markdown", "quarto", "rmd", "pandoc" },
                },
            })
            require("markview.extras.editor").setup({
                width = { 10, 0.75 },
                height = { 3, 0.75 },
                debounce = 50,
                callback = function(buf, win) end,
            })
        end,
    },
    {
        "heterophyllus/vscode-codev",
        lazy = true,
        ft = { "codev" },
    },
    {
        "GuillaumeAllain/vim-codevmacro",
        lazy = true,
        branch = "dev",
        ft = { "codev" },
    },
}
