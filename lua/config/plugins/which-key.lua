return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").add({
            { "<leader>g", group = "plugins" },
            {
                "<leader>gd",
                "\"dy:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>",
                desc = "macos dictionary",
                mode = "v",
            },
            { "<leader>g", group = "plugins" },
            {
                "<leader>gc",
                "<cmd>lua _G.toggle_cmp()<cr>",
                desc = "Toggle cmp",
            },
            {
                "<leader>gd",
                "\"dyiw:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>",
                desc = "macos dictionary",
            },
            {
                "<leader>gn",
                "<cmd>lua _G.toggle_statuscolumn()<cr>",
                desc = "Toggle Number",
            },
            -- {
            --     "<leader>gt",
            --     "<cmd>lua LazyGitOpener()<CR>",
            --     desc = "LazyGit",
            -- },
            -- { "<leader>m", group = "maker" },
            -- {
            --     "<leader>mc",
            --     "<cmd>lua require'utils'.send_command_to_build_terminal('maker clean')<cr>",
            --     desc = "Make Clean in BuildTerminal",
            -- },
            -- {
            --     "<leader>mm",
            --     "<cmd>lua require'utils'.send_command_to_build_terminal('maker make')<cr>",
            --     desc = "Make in BuildTerminal",
            -- },
            -- {
            --     "<leader>mo",
            --     "<cmd>lua require'utils'.send_command_to_build_terminal('maker open')<cr>",
            --     desc = "Make Open in BuildTerminal",
            -- },
            { "<leader>p", group = "panotes" },
            {
                "<leader>pa",
                "<cmd>Panotes openTagInput<cr>",
                desc = "open tags",
            },
            {
                "<leader>pc",
                "<cmd>Panotes capture<cr>",
                desc = "capture",
            },
            {
                "<leader>pd",
                "<cmd>Panotes openDiary<cr>",
                desc = "diary",
            },
            {
                "<leader>pg",
                "<cmd>Panotes liveGrep<cr>",
                desc = "live grep notes",
            },
            {
                "<leader>pj",
                "<cmd>Panotes openJournal<cr>",
                desc = "journal",
            },
            {
                "<leader>ps",
                "<cmd>Panotes searchTags<cr>",
                desc = "search tags",
            },
            {
                "<leader>pt",
                function()
                    vim.cmd("Panotes change_cwd_to_notes_dir")
                    Snacks.picker.todo_comments()
                end,
                desc = "Search todo in notes",
            },
        })
        require("which-key").setup({
            -- },
            plugins = {
                presets = {
                    operators = false,
                    windows = false,
                },
            },
        })
    end,
}
