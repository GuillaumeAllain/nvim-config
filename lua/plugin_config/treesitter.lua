local m = {}
function m.setup(treesitter_ft)
    require("nvim-treesitter.configs").setup({
        ensure_installed = treesitter_ft,

        highlight = {
            enable = true,
        },

        incremental_selection = {
            enable = true,
        },

        refactor = {
            highlight_definitions = { enable = true },
        },

        context = {
            enable = true,
        },
    })
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

return m
