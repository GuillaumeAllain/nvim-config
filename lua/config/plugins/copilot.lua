return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    config = function()
        require("copilot").setup({
            cmp = { enabled = true, method = "getCompletionsCycling" },
            ft_disable = { "pandoc", "markdown" },
        })
    end,
    enabled = false,
}
