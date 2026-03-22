local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_blink, blink = pcall(require, "blink.cmp")
if has_blink then
    capabilities = blink.get_lsp_capabilities(capabilities)
end

-- List of servers to enable
local servers = {
    "basedpyright",
    "rust_analyzer",
    "ruff",
    "lua_ls",
    "clangd",
    "fortls",
    "taplo",
    "ltex_plus",
    "sqlls",
    "r_language_server",
    "tinymist",
    }

local lspconfig = require("lspconfig")

-- Load and enable each server modularly using lspconfig for defaults
for _, server in ipairs(servers) do
    local ok, config = pcall(require, "config.lsp." .. server)
    local opts = {
        capabilities = capabilities,
    }
    if ok then
        opts = vim.tbl_deep_extend("force", opts, config)
    end
    lspconfig[server].setup(opts)
end

-- Global diagnostic settings
vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
})
