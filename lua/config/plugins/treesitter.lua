local treesitter_ft = {
    "python",
    "lua",
    "codecompanion",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "bash",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",
    config = function()
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if ok then
            configs.setup({
                ensure_installed = treesitter_ft,
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    -- disable = { "python", "latex", "fortran", "haskell", "julia" }, -- Restored
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = false },
                incremental_selection = {
                    enable = false,
                },
            })
        end
        -- Native Neovim folding setup (deferred)
        vim.schedule(function()
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end)
    end,
}
