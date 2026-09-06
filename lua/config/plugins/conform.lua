require("conform").setup({
    formatters = {
        air = {
            command = "pixi",
            args = { "exec", "air", "format", "$FILENAME" },
        },
        -- yamlfmt strips a leading `---` by default. Keep it when the buffer
        -- already has one, but don't add one to files that don't.
        yamlfmt = {
            prepend_args = function(_, ctx)
                local first = vim.api.nvim_buf_get_lines(ctx.buf, 0, 1, false)[1] or ""
                if vim.startswith(first, "---") then
                    return { "-formatter", "include_document_start=true" }
                end
                return {}
            end,
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
