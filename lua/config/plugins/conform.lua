require("conform").setup({
    formatters = {
        air = {
            command = "pixi",
            args = { "exec", "air", "format", "$FILENAME" },
        },
    },
    formatters_by_ft = {
        lua = { "stylua" },
        yaml = { "yamlfmt" },
        bib = { "bibtex-tidy" },
        fortran = { "fprettify" },
        codevlisp = { "fnlfmt" },
        rust = { "rustfmt" },
        typst = { "typstfmt" },
        r = { "air" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

vim.keymap.set("n", "grl", function()
    require("conform").format()
end, { desc = "Format current buffer" })
