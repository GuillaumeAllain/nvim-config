return {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        {
            "<C-i>",
            function()
                require("codecompanion").toggle()
                vim.defer_fn(function()
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
                        if ft == "codecompanion" then
                            vim.api.nvim_set_current_win(win)
                            break
                        end
                    end
                end, 100)
            end,
            desc = "Toggle & Focus CodeCompanion",
        },
    },
    opts = {
        strategies = {
            chat = {
                adapter = "copilot",
            },
            inline = {
                adapter = "copilot",
            },
            cmd = {
                adapter = "copilot",
            },
        },
        adapters = {
            copilot = function()
                return require("codecompanion.adapters").extend("copilot", {
                    schema = {
                        model = {
                            default = "claude-3.5-sonnet",
                        },
                    },
                })
            end,
        },
    },
}
