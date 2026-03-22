return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ui = {
                border = "rounded",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "basedpyright",
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
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "stylua",
                "yamlfmt",
                "bibtex-tidy",
                "fprettify",
                "fnlfmt",
                -- rustfmt is usually managed by rustup, but can be added here if needed
            },
            auto_update = true,
            run_on_start = true,
        },
    },
}
