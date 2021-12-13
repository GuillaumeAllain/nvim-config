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
    method = require("null-ls").methods.FORMATTING,
    filetypes = { "pandoc" },
    name = "pandotlint",
    generator = require("null-ls.helpers").formatter_factory({
        command = "pandotlint",
        format = "raw",
        to_stdin = true,
    }),
}
local yamllint = {
    method = require("null-ls").methods.FORMATTING,
    filetypes = { "yaml" },
    name = "yamllint",
    generator = require("null-ls.helpers").formatter_factory({
        command = "yamllint",
        args = { "-f", "parsasble", "-" },
        format = "raw",
        to_stdin = true,
    }),
}
require("null-ls").register(pandotlint)
require("null-ls").register(yamllint)

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.code_actions.gitsigns,
        require("null-ls").builtins.diagnostics.flake8.with({
            extra_args = { "--ignore=E203,W503", "--max-complexity=10", "--max-line-length=127" },
        }),
        require("null-ls").builtins.formatting.fprettify.with({ args = { "--silent", "--case", "2", "2", "2", "2" } }),
        require("null-ls").builtins.formatting.stylua,
    },
})

-- require("lspconfig")["null-ls"].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })
