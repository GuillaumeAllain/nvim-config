return {
    "abecodes/tabout.nvim",
    lazy = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("tabout").setup({
            tabkey = "<c-l>",
            act_as_tab = false,
            act_as_shit_tab = false,
            enable_backwards = false,
            completion = true,
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
