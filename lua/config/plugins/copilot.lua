return {
    "zbirenbaum/copilot.lua",
    lazy = false,
    init = function()
        require("copilot").setup({
            cmp = { enabled = true, method = "getCompletionsCycling" },
            ft_disable = { "pandoc", "markdown" },
        })
    end,
    enabled = false,
}
