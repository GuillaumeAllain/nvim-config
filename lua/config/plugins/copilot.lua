return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    event = "LazyFile",
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
    },
    -- config = function()
    --     require("copilot").setup({
    --         cmp = { enabled = true, method = "getCompletionsCycling" },
    --         ft_disable = { "pandoc", "markdown" },
    --     })
    -- end,
    -- enabled = True,
}
