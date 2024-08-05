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
