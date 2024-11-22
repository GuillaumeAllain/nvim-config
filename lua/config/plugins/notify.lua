return {
    "rcarriga/nvim-notify",
    enabled = false,
    lazy = true,
    init = function()
        vim.notify = require("notify")
        require("notify").setup({
            background_colour = "#000000",
            top_down = true,
            timeout = 50,
            render = "compact",
            stage = "static",
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { focusable = false })
            end,
        })
    end,
}
