return {
    "abecodes/tabout.nvim",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/vim-vsnip",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("tabout").setup({
            tabkey = "",
            act_as_tab = false,
            act_as_shit_tab = false,
            enable_backwards = false,
            completion = true,
            -- exclude = { "pandoc" },
            tabouts = {
                { open = "'", close = "'" },
                { open = '"', close = '"' },
                { open = "`", close = "`" },
                { open = "(", close = ")" },
                { open = "[", close = "]" },
                { open = "{", close = "}" },
                { open = "$", close = "$" },
            },
        })
    end,
}
