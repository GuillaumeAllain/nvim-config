-- Capabilities are registered by blink.cmp itself (plugin/blink-cmp.lua).
vim.lsp.enable({
    "ty",
    "rust_analyzer",
    "ruff",
    "lua_ls",
    "clangd",
    "fortls",
    "tombi",
    "ltex_plus",
    "sqlls",
    "r_language_server",
    "tinymist",
    "arduino_language_server",
})

-- vim.lsp.enable()'s built-in doautoall may be skipped this early in startup;
-- rerun it once all startup autocmds are done.
vim.schedule(function()
    vim.cmd.doautoall("nvim.lsp.enable FileType")
end)

require("mason").setup({ ui = { border = "rounded" } })

-- Not in mason: fnlfmt (install it yourself), air (via pixi exec), rustfmt (rustup).
vim.schedule(function()
    require("mason-tool-installer").setup({
        ensure_installed = {
            "rust-analyzer",
            "ruff",
            "lua-language-server",
            "clangd",
            "fortls",
            "tombi",
            "ltex-ls-plus",
            "sqlls",
            "tinymist",
            "stylua",
            "yamlfmt",
            "bibtex-tidy",
            "fprettify",
        },
        auto_update = true,
        run_on_start = true,
    })
end)
