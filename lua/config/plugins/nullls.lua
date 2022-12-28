return {
    "jose-elias-alvarez/null-ls.nvim",
    ft = require("config").lsp_ft,
    config = function()
        local nullls = require("null-ls")
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
    end,
    dependencies = {
        { "nvim-lua/plenary.nvim", module = "plenary" },
    },

}
