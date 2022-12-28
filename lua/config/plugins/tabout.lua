return {
    "abecodes/tabout.nvim",
    requires = {
        "hrsh7th/nvim-cmp", "hrsh7th/vim-vsnip",
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
        function _G.tabout_binding()
            if vim.fn.pumvisible() ~= 0 then
                return vim.api.nvim_replace_termcodes("<C-l>", true, true, true)
            elseif vim.fn["vsnip#available"](1) ~= 0 then
                return vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true)
            else
                return vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true)
            end
        end

        vim.api.nvim_set_keymap("i", "<C-L>", "v:lua.tabout_binding()", { expr = true })
    end,

}
