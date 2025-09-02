return {
    {
        "nvim-mini/mini.nvim",
        config = function()
            require("mini.indentscope").setup()
            vim.cmd([[autocmd TermOpen * lua vim.b.miniindentscope_disable = true]])
            require("mini.comment").setup({ options = { ignore_blank_lines = true } })
        end,
    },
    {
        "nvim-mini/mini.snippets",
        lazy = true,
        event = "InsertEnter",
        opts = function()
            local mini_snippets = require("mini.snippets")
            return {
                snippets = {
                    mini_snippets.gen_loader.from_file(vim.env.XDG_CONFIG_HOME .. "/nvim/snippets/global.json"),
                    mini_snippets.gen_loader.from_lang(),
                },

                expand = {},
            }
        end,
    },
    {
        "nvim-mini/mini.icons",
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
