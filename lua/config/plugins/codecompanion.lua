require("codecompanion").setup({
    strategies = {
        chat = { adapter = "copilot" },
        inline = { adapter = "copilot" },
        cmd = { adapter = "copilot" },
    },
    adapters = {
        copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
                schema = { model = { default = "Claude Sonnet 4.6" } },
            })
        end,
    },
})

vim.keymap.set("n", "<leader>i", function()
    require("codecompanion").toggle()
    vim.defer_fn(function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "codecompanion" then
                vim.api.nvim_set_current_win(win)
                break
            end
        end
    end, 100)
end, { desc = "Toggle & Focus CodeCompanion" })
