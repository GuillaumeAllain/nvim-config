require("which-key").register({
    d = { "<cmd>Bdelete<cr>", "Delete buffer" },
    f = {
        name = "telescope",
        g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep" },
        f = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buffers" },
        s = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "file browser" },
        d = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
        l = {
            "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>",
            "Lsp Workspace Symbols",
        },
        t = {
            "<cmd>lua require('telescope.builtin').builtin()<cr>",
            "Telescope Builtin",
        },
        z = {
            "<cmd>lua require('telescope.builtin').spell_suggest({layout_strategy='cursor', layout_config={height=0.3,width=0.5}})<cr>",
            "spell suggest",
        },
    },
    g = {
        name = "plugins",
        d = { "\"dyiw:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>", "macos dictionary" },
        l = { ":lua require'utils'.toggle_build_buffer_window()<cr>", "Toggle BuildTerminal in vsplit" },
        g = { "<cmd>FloatermToggle --autoclose=1 <CR>", "FloaTerm" },
        t = { "<cmd>lua LazyGitOpener()<CR>", "LazyGit" },
        y = { ":ZenMode <CR>", "Zen-mode" },
        j = { ":TodoTrouble <CR>", "TodoTrouble" },
        h = { ":TroubleToggle <CR>", "TroubleToggle" },
    },
    b = {
        name = "builder",
        b = {
            ":w|lua require'utils'.send_command_to_build_terminal('builder '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
            "Build in BuildTerminal",
        },
        o = {
            ":w|lua require'utils'.send_command_to_build_terminal('opener '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
            "Open in BuildTerminal",
        },
        c = {
            ":w|lua require'utils'.send_command_to_build_terminal('cleaner '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
            "Clean in BuildTerminal",
        },
    },
    m = {
        name = "maker",
        m = {
            ":w|lua require'utils'.send_command_to_build_terminal('maker make')<cr>",
            "Make in BuildTerminal",
        },
        o = {
            ":w|lua require'utils'.send_command_to_build_terminal('maker open')<cr>",
            "Make Open in BuildTerminal",
        },
        c = {
            ":w|lua require'utils'.send_command_to_build_terminal('maker clean')<cr>",
            "Make Clean in BuildTerminal",
        },
    },
    p = {
        name = "panotes",
        j = { ":Panotes openJournal<cr>", "journal" },
        d = { ":Panotes openDiary<cr>znzcGo", "diary" },
        t = { ":Panotes openTagInput<cr>", "open tags" },
        s = { ":Panotes searchTags<cr>", "search tags" },
        -- i = { ":Panotes export_to_org<cr>", "export to org" },
    },
}, {
    prefix = "<leader>",
})
require("which-key").register({
    g = {
        name = "plugins",
        d = { "\"dy:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>", "macos dictionary" },
    },
}, {
    prefix = "<leader>",
    mode = "v",
})
