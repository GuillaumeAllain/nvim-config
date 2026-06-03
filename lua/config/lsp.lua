local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_blink, blink = pcall(require, "blink.cmp")
if has_blink then
    capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.enable({
    "ty",
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
})

-- vim.lsp.enable()'s built-in doautoall is conditional on vim_did_enter or
-- did_filetype() being set, which may not hold when plugins load eagerly at
-- startup (before VimEnter). Scheduling ensures it runs after all startup
-- autocmds complete, at which point all open buffers have their filetypes set.
vim.schedule(function()
    vim.cmd.doautoall("nvim.lsp.enable FileType")
end)
