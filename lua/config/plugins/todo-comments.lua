local c = function(n) return vim.g["terminal_color_" .. n] end
require("todo-comments").setup({
    highlight = { comments_only = false },
    keywords = {
        FIX = { icon = " ", color = c(2), alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = c(6), alt = { "À faire" } },
        HACK = { icon = " ", color = c(2) },
        WARN = { icon = " ", color = c(3), alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", color = c(3), alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = c(5) },
    },
})
