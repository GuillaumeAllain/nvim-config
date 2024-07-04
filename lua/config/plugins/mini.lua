return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.indentscope").setup()
            vim.cmd([[autocmd TermOpen * lua vim.b.miniindentscope_disable = true]])
            require("mini.comment").setup({ options = { ignore_blank_lines = true } })
        end,
    },
    {
        "echasnovski/mini.icons",
        opts = {},
        lazy = true,
        specs = {
            { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                -- needed since it will be false when loading and mini will fail
                package.loaded["nvim-web-devicons"] = {}
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
}
