local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(client)
    -- if client.resolved_capabilities.document_formatting then
    --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil,5000)")
    -- end
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
    })
    -- require "lsp_signature".on_attach(
    -- {
    --     hint_enable=false,
    -- }
    -- )
    vim.diagnostic.open_float(nil, {
        source = "always",
    })
end

require("lspconfig").jedi_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        hover = {
            enable = true,
        },
    },
    root_dir = function(fname)
        return require("lspconfig").util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end,
})

require("lspconfig").fortls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "fortls",
        "--nthreads",
        "2",
        "--use_signature_help",
        "--hover_signature",
    },
})

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = os.getenv("HOME") .. "/srv/lua-language-server"

local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

require("lspconfig").sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
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
            return require("lspconfig.util").find_git_ancestor(fname) or require("lspconfig.util").path.dirname(fname)
        end,
        -- log_level = vim.lsp.protocol.MessageType.Warning,
        default_config = {
            root_dir = [[root_pattern(".git") or bufdir]],
        },
    },
}

require("lspconfig").haskell_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

local function find_toml(startpath)
    return require("lspconfig").util.search_ancestors(startpath, function(path)
        if require("lspconfig").util.path.is_file(require("lspconfig").util.path.join(path, "Project.toml")) then
            return path
        end
    end)
end

require("lspconfig").julials.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function(fname)
        return find_toml(fname) or vim.fn.getcwd()
    end,
})

-- require("grammar-guard").init()

-- require("lspconfig").grammar_guard.setup({
local ltex_path = vim.fn.stdpath("data") .. "/lsp_servers/ltex/ltex-ls/bin/ltex-ls"

require("lspconfig").ltex.setup({
    on_attach = on_attach(),
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
            setenceCacheSize = 2000,
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "fr",
            },
            markdown = {
                nodes = { CodeBlock = "ignore", FencedCodeBlock = "ignore", AutoLink = "dummy", Code = "dummy" },
            },
            trace = { server = "verbose" },
            dictionary = { fr = { "align" } },
            disabledRules = {
                fr = {
                    "APOS_TYP",
                    "FR_SPELLING_RULE",
                    "FRENCH_WHITESPACE",
                    "COMMA_PARENTHESIS_WHITESPACE",
                    "FLECHES",
                    "WHITESPACE_RULE",
                    "ESPACE_POURCENT",
                    "TIRET_BAS",
                    "TOO_LONG_SENTENCE",
                },
                en = {
                    "WORD_CONTAINS_UNDERSCORE",
                    "SENTENCE_FRAGMENT",
                    "DASH_RULE",
                    "TOO_LONG_SENTENCE",
                    "TOO_LONG_PARAGRAPH",
                    "PASSIVE_VOICE",
                    "PUNCTUATION_PARAGRAPH_END",
                    "COMMA_PARENTHESIS_WHITESPACE",
                    "EN_QUOTES",
                    "NON_STANDARD_WORD",
                },
            },
        },
    },
})
