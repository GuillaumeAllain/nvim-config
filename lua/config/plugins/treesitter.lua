return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",
    config = function()
        -- The main branch dropped nvim-treesitter.configs. Highlighting is
        -- now enabled per-buffer via vim.treesitter.start().
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
                if lang then
                    pcall(vim.treesitter.start, ev.buf, lang)
                end
            end,
        })

        vim.schedule(function()
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end)
    end,
}
