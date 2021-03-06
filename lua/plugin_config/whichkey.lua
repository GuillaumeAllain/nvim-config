require("which-key").register({
    d = { "<cmd>Bdelete<cr>", "Delete buffer" },
    t = {
        name = "neotest",
        r = {"<cmd>lua require('neotest').run.run()<cr>", "run file"},
        t = {"<cmd>lua require('neotest').summary.toggle()<cr>", "toggle summary"},
    },
    f = {
        name = "telescope",
        g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep" },
        f = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buffers" },
        s = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", "file browser" },
        d = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
        b = { "<cmd>lua require('telescope').extensions.bibtex.bibtex({format='markdown'})<cr>", "bibtex" },
        h = {"<cmd> Telescope howdoi<cr>", "howdoi"},
        l = {
            "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
            "Lsp document symbols",
        },
        k = {
            "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>",
            "Lsp workspace symbols",
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
        j = { "<cmd>Panotes openJournal<cr>", "journal" },
        d = { "<cmd>Panotes openDiary<cr>", "diary" },
        a = { "<cmd>Panotes openTagInput<cr>", "open tags" },
        s = { "<cmd>Panotes searchTags<cr>", "search tags" },
        c = { "<cmd>Panotes capture<cr>", "capture" },
        t = { "<cmd>Panotes change_cwd_to_notes_dir<cr>:TodoTelescope<cr> ", "capture" },
        g = {
            "<cmd>Panotes liveGrep<cr>",
            "live grep notes",
        },
    },
    g = {
        name = "plugins",
        d = { "\"dyiw:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>", "macos dictionary" },
        l = { "<cmd>lua require'utils'.toggle_build_buffer_window()<cr>", "Toggle BuildTerminal in vsplit" },
        g = { "<cmd>FloatermToggle --autoclose=1 <CR>", "FloaTerm" },
        t = { "<cmd>lua LazyGitOpener()<CR>", "LazyGit" },
        y = { "<cmd>ZenMode <CR>", "Zen-mode" },
        j = { "<cmd>TodoTrouble <CR>", "TodoTrouble" },
        h = { "<cmd>TroubleToggle <CR>", "TroubleToggle" },
        c = { "<cmd>lua _G.toggle_cmp()<cr>", "Toggle cmp" },
        n = { "<cmd>set relativenumber!| set number!<cr>", "Toggle Number" },
        s = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
        k = { "<cmd>Luapad<cr>", "Luapad" },
    },
    b = {
        name = "builder",
        b = {
            "<cmd>w|lua require'utils'.send_command_to_build_terminal('builder '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
            "Build in BuildTerminal",
        },
        l = {
            "<cmd>w|lua require'utils'.send_command_to_build_terminal('\\x1b\\x4f\\x41')<cr>",
            "Build in BuildTerminal",
        },
        o = {
            "<cmd>lua require'utils'.send_command_to_build_terminal('opener '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
            "Open in BuildTerminal",
        },
        c = {
            "<cmd>lua require'utils'.send_command_to_build_terminal('cleaner '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
            "Clean in BuildTerminal",
        },
    },
    m = {
        name = "maker",
        m = {
            "<cmd>lua require'utils'.send_command_to_build_terminal('maker make')<cr>",
            "Make in BuildTerminal",
        },
        o = {
            "<cmd>lua require'utils'.send_command_to_build_terminal('maker open')<cr>",
            "Make Open in BuildTerminal",
        },
        c = {
            "<cmd>lua require'utils'.send_command_to_build_terminal('maker clean')<cr>",
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
