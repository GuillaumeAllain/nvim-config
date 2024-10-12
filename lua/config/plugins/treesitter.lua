return {
    "nvim-treesitter/nvim-treesitter",
    event = { "LazyFile" },
    dependencies = { "romgrk/nvim-treesitter-context" },
    lazy = true,
    ft = require("config").treesitter_ft,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = require("config").treesitter_ft,
            highlight = {
                enable = true,
                disable = function(lang, bufnr)
                    return vim.api.nvim_buf_get_name(bufnr):sub(-2) == ".f"
                end,
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
        vim.treesitter.language.register("fennel", "codevlisp")
        vim.treesitter.language.register("markdown", "pandoc")
        vim.treesitter.language.register("latex", "tikz")
        -- require("nvim-treesitter.parsers").filetype_to_parsername.pandoc = "markdown"
        -- require("nvim-treesitter.parsers").filetype_to_parsername.codevlisp = "fennel"
        -- require("nvim-treesitter.parsers").filetype_to_parsername.tikz = "latex"
        -- require"nvim-treesitter.parsers".filetype_to_parsername.pandoc = "markdown"
        vim.g.markdown_folding = 1

        -- vim.wo.foldtext =
        --     [[substitute(getline(v:foldstart),'\\t',repeat('\t',&tabstop),'g').'...'.trim(getline(v:foldend))]]
        -- vim.cmd[[set fillchars=fold:\ ,eob:\ ]]
        -- vim.wo.foldnestmax = 3
        -- vim.wo.foldminlines = 1

        -- vim.cmd[[hi! EndOfBuffer guibg=none ctermbg=none]]
        -- vim.cmd[[hi! SignColumn guibg=none ctermbg=none]]
        -- vim.cmd([[e .hidden_file.md|bd]])
        -- vim.treesitter.require_language("markdown")
    end,
}
