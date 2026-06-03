-- Deferred: copilot only matters once you start completing/inserting.
vim.schedule(function()
    require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
    })
end)
