return {
    "hrsh7th/vim-vsnip",
    event = "InsertEnter",
    config = function()
        vim.g.vsnip_snippet_dir = vim.fn.expand(os.getenv("XDG_CONFIG_HOME") .. "/vsnip")
        vim.api.nvim_exec(
            [[
        autocmd FileType * call vsnip#get_complete_items(bufnr())
        ]]   ,
            false
        )
        vim.cmd([[
        imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
        smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
        ]])
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
}
