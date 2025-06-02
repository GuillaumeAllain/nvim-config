return {
    "hrsh7th/vim-vsnip",
    enabled=false,
    event = "InsertEnter",
    commit="02a8e79295c9733434aab4e0e2b8c4b7cea9f3a9",
    config = function()
        vim.g.vsnip_snippet_dir = vim.fn.expand(os.getenv("XDG_CONFIG_HOME") .. "/vsnip")
        vim.api.nvim_exec2(
            [[
        autocmd FileType * call vsnip#get_complete_items(bufnr())
        ]],
            {}
        )
        -- vim.cmd([[
        -- imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
        -- smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
        -- ]])
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
}
