local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
vim.lsp.config("*", {
    capabilities = capabilities,
    root_markers = { ".git" },
})
vim.lsp.enable({
    "basedpyright",
    "arduino_language_server",
    -- "rustfmt",
    "rust_analyzer",
    "ruff",
    "lua_ls",
    "clangd",
    "fortls",
    "taplo",
    "ltex_plus",
    "sqlls",
    -- "r_language_server",
})
