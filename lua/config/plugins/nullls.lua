return {
    "nvimtools/none-ls.nvim",
    ft = CONFIG_LSP_FT,
    event = { "LazyFile" },
    lazy = true,
    config = function()
        local nullls = require("null-ls")
        -- local python_location = vim.env.HOME .. "/micromamba/bin/"
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
                -- nullls.builtins.code_actions.gitsigns,
                nullls.builtins.formatting.biome,
                nullls.builtins.formatting.astyle,
                nullls.builtins.formatting.bibclean,
                nullls.builtins.formatting.fprettify.with({ args = { "--case", "1", "1", "1", "1" } }),
                nullls.builtins.formatting.stylua,
                nullls.builtins.formatting.fnlfmt.with({ filetypes = { "fnl", "fennel", "codevlisp" } }),
            },
        })
    end,
    dependencies = {
        { "nvim-lua/plenary.nvim", module = "plenary" },
        "nvimtools/none-ls-extras.nvim",
    },
}
