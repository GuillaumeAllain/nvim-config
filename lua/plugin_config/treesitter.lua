local m = {}

function m.setup(treesitter_ft)
    require("nvim-treesitter.install").compilers = { "gcc-11" }
    require("nvim-treesitter.configs").setup({
        ensure_installed = treesitter_ft,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "org" , "markdown"}, -- Required since TS highlighter doesn't support all syntax features (conceal)
            -- disable={"markdown"}
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
    require"nvim-treesitter.parsers".filetype_to_parsername.pandoc = "markdown"
    vim.g.markdown_folding = 1

    -- vim.wo.foldtext =
    --     [[substitute(getline(v:foldstart),'\\t',repeat('\t',&tabstop),'g').'...'.trim(getline(v:foldend))]]
    -- vim.cmd[[set fillchars=fold:\ ,eob:\ ]]
    -- vim.wo.foldnestmax = 3
    -- vim.wo.foldminlines = 1

    -- vim.cmd[[hi! EndOfBuffer guibg=none ctermbg=none]]
    -- vim.cmd[[hi! SignColumn guibg=none ctermbg=none]]
end

return m
