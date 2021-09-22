require("which-key").register({
    d = { "<cmd>Bdelete<cr>", "Delete buffer" },
    f = {
        name = "telescope",
        g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep" },
        f = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buffers" },
        s = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "file browser" },
        d = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
        l = {
            "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
            "Lsp Code Actions",
        },
        t = {
            "<cmd>lua require('telescope.builtin').builtin()<cr>",
            "Telescope Builtin",
        },
        z = {
            "<cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))<cr>",
            "spell suggest",
        },
    },
    p = {
        name = "panotes",
        j = { ":Panotes openJournal<cr>", "journal" },
        d = { ":Panotes openDiary<cr>", "diary" },
        t = { ":Panotes openTagInput<cr>", "open tags" },
        s = { ":Panotes searchTags<cr>", "search tags" },
        c = { ":Panotes capture<cr>", "capture" },
        t = { ":Panotes change_cwd_to_notes_dir<cr>:TodoTelescope<cr> ", "capture" },
        g = {
            ":lua require'panotes'.change_cwd_to_notes_dir()<cr>:lua require'telescope.builtin'.live_grep()<cr>",
            "live grep notes",
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
