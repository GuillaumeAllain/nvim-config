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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
vim.lsp.config("*", {
    capabilities = capabilities,
    root_markers = { ".git" },
})
vim.lsp.enable({
    "pyright",
    "ty",
    "ruff",
    "lua_ls",
    "clangd",
    "fortls",
    "taplo",
    "ltex_plus",
    "sqlls",
    "r_language_server",
})
