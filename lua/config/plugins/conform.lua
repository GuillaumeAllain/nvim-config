return {
    "stevearc/conform.nvim",
    lazy = true,
    cmd = "ConformInfo",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            yaml = { "yamlfmt" },
            bib = { "bibtex-tidy" },
            fortran = { "fprettify" },
            codevlisp = { "fnlfmt" },
            rust = { "rustfmt" },
            typst= {"typstfmt" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
    keys = {
        {
            "grl",

            function()
                require("conform").format()
            end,
            desc = "Format current buffer",
        },
    },
}
