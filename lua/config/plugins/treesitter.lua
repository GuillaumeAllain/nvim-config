local treesitter_ft = {
    "bash",
    "bibtex",
    "c",
    "comment",
    "css",
    -- "fennel",
    "fortran",
    -- "haskell",
    "html",
    "javascript",
    "julia",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "norg",
    "python",
    "query",
    "r",
    "regex",
    "rust",
    "scss",
    "svelte",
    "toml",
    "tsx",
    "typst",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if ok then
            configs.setup({
                ensure_installed = treesitter_ft,
                highlight = {
                    enable = true,
                    -- disable = { "python", "latex", "fortran", "haskell", "julia" }, -- Restored
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            })
        end
        -- Native Neovim folding setup
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
}
