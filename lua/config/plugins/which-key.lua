return {
    "folke/which-key.nvim",
    config = function()
        -- require("which-key").register({
        --     b = {
        --         name = "builder",
        --     },
        --     d = { "<cmd>Bdelete<cr>", "Delete buffer" },
        --     t = {
        --         name = "neotest",
        --         r = { "<cmd>lua require('neotest').run.run()<cr>", "run file" },
        --         t = { "<cmd>lua require('neotest').summary.toggle()<cr>", "toggle summary" },
        --     },
        --     r = {
        --         name = "harpoon",
        --         r = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Quick Menu" },
        --         w = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
        --         e = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file" },
        --         t = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
        --     },
        --     f = {
        --         name = "telescope",
        --         g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep" },
        --         f = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buffers" },
        --         s = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "file browser" },
        --         d = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
        --         a = { "<cmd>lua require('telescope');vim.lsp.buf.code_action()<cr>", "code actions" },
        --         b = { "<cmd>lua require('telescope').extensions.bibtex.bibtex({format='markdown'})<cr>", "bibtex" },
        --         l = {
        --             "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
        --             "Lsp document symbols",
        --         },
        --         k = {
        --             "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>",
        --             "Lsp workspace symbols",
        --         },
        --         t = {
        --             "<cmd>lua require('telescope.builtin').builtin()<cr>",
        --             "Telescope Builtin",
        --         },
        --         z = {
        --             "<cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))<cr>",
        --             "spell suggest",
        --         },
        --     },
        --     p = {
        --         name = "panotes",
        --         j = { "<cmd>Panotes openJournal<cr>", "journal" },
        --         d = { "<cmd>Panotes openDiary<cr>", "diary" },
        --         a = { "<cmd>Panotes openTagInput<cr>", "open tags" },
        --         s = { "<cmd>Panotes searchTags<cr>", "search tags" },
        --         c = { "<cmd>Panotes capture<cr>", "capture" },
        --         t = { "<cmd>Panotes change_cwd_to_notes_dir<cr><cmd>Telescope todo-comments todo<cr>", "capture" },
        --         g = {
        --             "<cmd>Panotes liveGrep<cr>",
        --             "live grep notes",
        --         },
        --     },
        --     g = {
        --         name = "plugins",
        --         d = { "\"dyiw:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>", "macos dictionary" },
        --         l = { "<cmd>lua require'harpoon'.toggle_term_window()<cr>", "Toggle HarpoonTerm(1) in vsplit" },
        --         t = { "<cmd>lua LazyGitOpener()<CR>", "LazyGit" },
        --         y = { "<cmd>ZenMode <CR>", "Zen-mode" },
        --         j = { "<cmd>Trouble toggle todo <CR>", "TodoTrouble" },
        --         h = { "<cmd>Trouble toggle diagnostics <CR>", "TroubleToggle" },
        --         c = { "<cmd>lua _G.toggle_cmp()<cr>", "Toggle cmp" },
        --         n = {
        --             "<cmd>lua _G.toggle_statuscolumn()<cr>",
        --             "Toggle Number",
        --         },
        --         k = { "<cmd>Luapad<cr>", "Luapad" },
        --         u = { "<cmd>lua require'utils'.toggle_background()<cr>", "Kitty" },
        --     },
        --     m = {
        --         name = "maker",
        --         m = {
        --             "<cmd>lua require'utils'.send_command_to_build_terminal('maker make')<cr>",
        --             "Make in BuildTerminal",
        --         },
        --         o = {
        --             "<cmd>lua require'utils'.send_command_to_build_terminal('maker open')<cr>",
        --             "Make Open in BuildTerminal",
        --         },
        --         c = {
        --             "<cmd>lua require'utils'.send_command_to_build_terminal('maker clean')<cr>",
        --             "Make Clean in BuildTerminal",
        --         },
        --     },
        -- }, {
        --     prefix = "<leader>",
        -- })

        require("which-key").add({
            { "<leader>g", group = "plugins" },
            {
                "<leader>gd",
                "\"dy:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>",
                desc = "macos dictionary",
                mode = "v",
            },
            { "<leader>b", group = "builder" },
            {
                "<leader>d",
                "<cmd>Bdelete<cr>",
                desc = "Delete buffer",
            },
            { "<leader>f", group = "telescope" },
            {
                "<leader>fa",
                "<cmd>lua require('telescope');vim.lsp.buf.code_action()<cr>",
                desc = "code actions",
            },
            {
                "<leader>fb",
                "<cmd>lua require('telescope').extensions.bibtex.bibtex({format='markdown'})<cr>",
                desc = "bibtex",
            },
            {
                "<leader>fd",
                "<cmd>lua require('telescope.builtin').find_files()<cr>",
                desc = "find files",
            },
            {
                "<leader>ff",
                "<cmd>lua require('telescope.builtin').buffers()<cr>",
                desc = "buffers",
            },
            {
                "<leader>fg",
                "<cmd>lua require('telescope.builtin').live_grep()<cr>",
                desc = "live grep",
            },
            {
                "<leader>fk",
                "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>",
                desc = "Lsp workspace symbols",
            },
            {
                "<leader>fl",
                "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
                desc = "Lsp document symbols",
            },
            {
                "<leader>fs",
                "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>",
                desc = "file browser",
            },
            {
                "<leader>ft",
                "<cmd>lua require('telescope.builtin').builtin()<cr>",
                desc = "Telescope Builtin",
            },
            {
                "<leader>fz",
                "<cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))<cr>",
                desc = "spell suggest",
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
                "<leader>gh",
                "<cmd>Trouble toggle diagnostics <CR>",
                desc = "TroubleToggle",
            },
            {
                "<leader>gj",
                "<cmd>Trouble toggle todo <CR>",
                desc = "TodoTrouble",
            },
            {
                "<leader>gk",
                "<cmd>Luapad<cr>",
                desc = "Luapad",
            },
            {
                "<leader>gl",
                "<cmd>lua require'harpoon'.toggle_term_window()<cr>",
                desc = "Toggle HarpoonTerm(1) in vsplit",
            },
            {
                "<leader>gn",
                "<cmd>lua _G.toggle_statuscolumn()<cr>",
                desc = "Toggle Number",
            },
            {
                "<leader>gt",
                "<cmd>lua LazyGitOpener()<CR>",
                desc = "LazyGit",
            },
            {
                "<leader>gu",
                "<cmd>lua require'utils'.toggle_background()<cr>",
                desc = "Kitty",
            },
            {
                "<leader>gy",
                "<cmd>ZenMode <CR>",
                desc = "Zen-mode",
            },
            { "<leader>m", group = "maker" },
            {
                "<leader>mc",
                "<cmd>lua require'utils'.send_command_to_build_terminal('maker clean')<cr>",
                desc = "Make Clean in BuildTerminal",
            },
            {
                "<leader>mm",
                "<cmd>lua require'utils'.send_command_to_build_terminal('maker make')<cr>",
                desc = "Make in BuildTerminal",
            },
            {
                "<leader>mo",
                "<cmd>lua require'utils'.send_command_to_build_terminal('maker open')<cr>",
                desc = "Make Open in BuildTerminal",
            },
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
                "<cmd>Panotes change_cwd_to_notes_dir<cr><cmd>Telescope todo-comments todo<cr>",
                desc = "capture",
            },
            { "<leader>r", group = "harpoon" },
            {
                "<leader>re",
                "<cmd>lua require('harpoon.ui').nav_next()<cr>",
                desc = "Next file",
            },
            {
                "<leader>rr",
                "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
                desc = "Quick Menu",
            },
            {
                "<leader>rt",
                "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
                desc = "Prev file",
            },
            {
                "<leader>rw",
                "<cmd>lua require('harpoon.mark').add_file()<cr>",
                desc = "Add file",
            },
            { "<leader>t", group = "neotest" },
            {
                "<leader>tr",
                "<cmd>lua require('neotest').run.run()<cr>",
                desc = "run file",
            },
            {
                "<leader>tt",
                "<cmd>lua require('neotest').summary.toggle()<cr>",
                desc = "toggle summary",
            },
        })
        require("which-key").setup({
            -- triggers_blacklist = {
            --     n = { "s" },
            --     v = { "g" },
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
