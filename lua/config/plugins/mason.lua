-- :MasonUpdate runs via the PackChanged hook in the loader.
require("mason").setup({
    ui = {
        border = "rounded",
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",
        "ruff",
        "lua_ls",
        "clangd",
        "fortls",
        "taplo",
        "ltex_plus",
        "sqlls",
        "tinymist",
    },
    automatic_installation = true,
    automatic_enable = {
        exclude = { "basedpyright" },
    },
})

-- Deferred: installs/updates tools in the background, not needed at startup.
vim.schedule(function()
    require("mason-tool-installer").setup({
        ensure_installed = {
            "stylua",
            "yamlfmt",
            "bibtex-tidy",
            "fprettify",
            -- fnlfmt is not in the mason registry; install it yourself (conform
            -- picks it up from PATH for codevlisp formatting).
            -- air (R formatter) is invoked via pixi exec; install with:
            --   pixi global install r-air (or add r-air to your pixi project)
            -- rustfmt is usually managed by rustup, but can be added here if needed
        },
        auto_update = true,
        run_on_start = true,
    })
end)
