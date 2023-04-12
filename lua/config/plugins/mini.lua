return {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
        require("mini.indentscope").setup()
        vim.cmd([[autocmd TermOpen * lua vim.b.miniindentscope_disable = true]])
        require("mini.comment").setup({options={ignore_blank_lines=true}})
    end,
}
