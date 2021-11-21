local m = {}

function m.setup(treesitter_ft)
    require'nvim-treesitter.install'.compilers = { "gcc-11" }
    require("nvim-treesitter.configs").setup({
        ensure_installed = treesitter_ft,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
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
    vim.wo.foldtext =
        [[substitute(getline(v:foldstart),'\\t',repeat('\t',&tabstop),'g').'...'.trim(getline(v:foldend))]]
    vim.cmd[[set fillchars=fold:\ ,eob:\ ]]
    vim.wo.foldnestmax = 3
    vim.wo.foldminlines = 1
    -- vim.cmd[[hi! EndOfBuffer guibg=none ctermbg=none]]
    -- vim.cmd[[hi! SignColumn guibg=none ctermbg=none]]
end

return m
