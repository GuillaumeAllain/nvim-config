vim.g.mapleader = " "

require("config.lazy")

require("config.vim-settings")

require("config.vim-keymaps")

require("config.plugins-keymaps")

CONFIG_LSP_FT = {
    "python",
    "pandoc",
    "yaml",
    "toml",
    "fortran",
    "haskell",
    "lua",
    "julia",
    "apl",
    "fennel",
    "codevlisp",
    "r",
    "json",
}
vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            },
        },
    },
    root_markers = { ".git" },
})
vim.lsp.enable({ "ty" })
