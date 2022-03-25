local nullls = require("null-ls")
-- local fprettify={
--             method = require("null-ls").methods.FORMATTING,
--             filetypes = { "fortran" },
--             name = "fprettify",
--             generator = require("null-ls.helpers").formatter_factory({
--                 command = "fprettify",
--                 args = { "-s", "--case", "2", "2", "2", "2" },
--                 format = "raw",
--                 to_stdin = true,
--             }),
-- }
local pandotlint = {
    method = nullls.methods.FORMATTING,
    filetypes = { "pandoc" },
    name = "pandotlint",
    generator = require("null-ls.helpers").formatter_factory({
        command = "pandotlint",
        format = "raw",
        to_stdin = true,
    }),
}
local yamllint = {
    method = nullls.methods.FORMATTING,
    filetypes = { "yaml" },
    name = "yamllint",
    generator = require("null-ls.helpers").formatter_factory({
        command = "yamllint",
        args = { "-f", "parsasble", "-" },
        format = "raw",
        to_stdin = true,
    }),
}
nullls.register(pandotlint)
nullls.register(yamllint)
nullls.setup({
    -- on_attach = require "lsp-format".on_attach,
    sources = {
        nullls.builtins.formatting.black,
        nullls.builtins.code_actions.gitsigns,
        nullls.builtins.diagnostics.flake8.with({
            extra_args = { "--ignore=E203,W503", "--max-complexity=10", "--max-line-length=127" },
        }),
        nullls.builtins.formatting.fprettify.with({ args = { "--silent", "--case", "2", "2", "2", "2" } }),
        nullls.builtins.formatting.stylua,
        nullls.builtins.formatting.fnlfmt.with({ filetypes = { "fnl", "fennel", "codevlisp" } }),
    },
})

-- require("lspconfig")["null-ls"].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })
