return {
    "rcarriga/nvim-notify",
    init = function()
        vim.notify = require("notify")
        require("notify").setup({
            background_colour = "#000000",
            top_down = true,
            timeout = 2500,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { focusable = false })
            end,
        })
    end,
}
