return {
    { "markonm/traces.vim",        keys = { ":", "/", "?" } },
    { "zerowidth/vim-copy-as-rtf", cmd = { "CopyRTF" } },
    { "romainl/vim-cool",          lazy = false },
    { "wellle/targets.vim",        lazy = false },
    { "tpope/vim-eunuch",          lazy = false },
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
        dependencies = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "vim-pandoc/vim-pandoc-syntax",
        ft = { "pandoc" },
        config = function()
            vim.g["pandoc#syntax#conceal#cchar_overrides"] = { atx = "#" }
            vim.g["pandoc#modules#disabled"] = { "folding" }
            vim.g["pandoc#filetypes#handled"] = { "pandoc", "markdown" }
            vim.g["pandoc#syntax#style#use_definition_lists"] = 0
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        -- cmd = {"Gitsigns"},
        -- event = { "BufReadPost", "FileReadPost" },
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup({
                signcolumn = false,
                numhl = false,
            })
        end,
    },
    {
        "echasnovski/mini.nvim",
        lazy = false,
        config = function()
            require("mini.indentscope").setup()
            vim.cmd([[autocmd TermOpen * lua vim.b.miniindentscope_disable = true]])
        end,
    },
    {
        "dhruvasagar/vim-table-mode",
        ft = { "markdown", "pandoc", "tex" },

        init = function()
            require("which-key").register({ t = { name = "table mode" } }, { prefix = "<leader>" })
            vim.cmd([[let g:table_mode_map_prefix = '<Leader>tm']])
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
