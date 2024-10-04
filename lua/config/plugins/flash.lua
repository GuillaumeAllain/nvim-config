return {
    "folke/flash.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "sf",
            mode = { "n", "x", "o" },
            function()
                -- default options: exact mode, multi window, all directions, with a backdrop
                require("flash").jump()
            end,
        },
        {
            "S",
            mode = { "n", "o", "x" },
            function()
                require("flash").treesitter()
            end,
        },
    },
}
