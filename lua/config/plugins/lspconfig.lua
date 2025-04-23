return {
    "neovim/nvim-lspconfig",
    event = { "LazyFile" },
    lazy = true,
    ft = CONFIG_LSP_FT,
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        local lspconfig = require("lspconfig")

        local on_attach = function(client)
            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    update_in_insert = true,
                })
        end

        lspconfig.pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.clangd.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.taplo.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.r_language_server.setup({
            cmd = {
                "pixi",
                "exec",
                "--spec",
                "r-base",
                "--spec",
                "r-languageserver",
                "R",
                "--slave",
                "-e",
                "languageserver::run()",
            },
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.fortls.setup({
            on_attach = on_attach,
        })

        local sumneko_binary = os.getenv("HOMEBREW_PREFIX") .. "/bin/lua-language-server"

        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { sumneko_binary, "-E" },
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                        -- Setup your lua path
                        path = vim.split(package.path, ";"),
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim", "pandoc" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        },
                    },
                },
            },
        })

        lspconfig.sqlls.setup({})

        -- local dyalog_bin = "/Applications/Dyalog-18.0.app/Contents/Resources/Dyalog/mapl"
        --
        -- local apl_ls_root_path = os.getenv("HOME") .. "~/srv/apl-language-server"
        --
        -- local apl_ls_binary = apl_ls_root_path .. "/APLSource/" .. "/Run.aplf"
        --
        require("lspconfig.configs").haskell_language_server = {
            default_config = {
                filetypes = { "haskell" },
                cmd = { "haskell-language-server-wrapper", "--lsp" },
                root_dir = function(fname)
                    return require("lspconfig.util").find_git_ancestor(fname)
                        or require("lspconfig.util").path.dirname(fname)
                end,
                -- log_level = vim.lsp.protocol.MessageType.Warning,
                default_config = {
                    root_dir = [[root_pattern(".git") or bufdir]],
                },
            },
        }

        lspconfig.haskell_language_server.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        local function find_toml(startpath)
            return lspconfig.util.search_ancestors(startpath, function(path)
                if lspconfig.util.path.is_file(lspconfig.util.path.join(path, "Project.toml")) then
                    return path
                end
            end)
        end

        lspconfig.julials.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = function(fname)
                return find_toml(fname) or vim.fn.getcwd()
            end,
        })

        local ltex_path = vim.fn.expand("$HOMEBREW_PREFIX/bin/ltex-ls")
        vim.fn.system("mkdir -p $XDG_CACHE_HOME/ltex/")

        lspconfig.ltex.setup({
            -- on_attach = on_attach(),
            on_attach = function(client, bufnr)
                -- your other on_attach functions.
                on_attach(client)
                require("ltex_extra").setup({
                    load_langs = { "fr", "en-us" },                 -- table <string> : languages for witch dictionaries will be loaded
                    init_check = true,                              -- boolean : whether to load dictionaries on startup
                    path = vim.fn.expand("$XDG_CONFIG_HOME/ltex/"), -- string : path to store dictionaries. Relative path uses current working directory
                    log_level = "none",                             -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
                })
            end,
            cmd = { ltex_path },
            filetypes = { "pandoc", "latex", "tex", "bib", "markdown" },
            get_language_id = function(_, ftype)
                if ftype == "pandoc" then
                    return "markdown"
                else
                    return ftype
                end
            end,
            settings = {
                ltex = {
                    enabled = { "latex", "tex", "bib", "markdown" },
                    language = "fr",
                    diagnosticSeverity = "information",
                    setenceCacheSize = 5000,
                    additionalRules = {
                        enablePickyRules = true,
                        motherTongue = "fr",
                    },
                    markdown = {
                        nodes = { CodeBlock = "ignore", FencedCodeBlock = "ignore", AutoLink = "dummy", Code = "dummy" },
                    },
                    trace = { server = "verbose" },
                },
            },
        })
        require("which-key").add({
            { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async=true})<cr>", desc = "Lsp Formatting" },
            { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",             desc = "Lsp Rename" },
        })
    end,
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
        },
        {
            "barreiroleo/ltex_extra.nvim",
        },
        {
            url = "https://gitlab.com/yorickpeterse/nvim-dd.git",
            config = function()
                require("dd").setup({ timeout = 250 })
            end,
        },
    },
}
