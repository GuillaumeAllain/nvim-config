return {
    "folke/snacks.nvim",
    priority = 1000,
    event = "VeryLazy",
    opts = {
        bigfile = { enabled = true },
        image = { enabled = true, doc = { inline = false } },
        explorer = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        words = { enabled = true },
        scratch = { enabled = true },
        LSP = { enabled = true },
        picker = {
            enabled = true,
            win = { input = { keys = { ["<C-space>"] = { "toggle_live", mode = { "i", "n" } } } } },
        },
        styles = {
            notification = {
                focusable = false,
            },
        },
    },
    keys = {
        {
            "<leader>fg",
            function()
                Snacks.picker.git_files()
            end,
            desc = "Git Files",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent Files",
        },
        {
            "<leader>f/",
            function()
                Snacks.picker.lines()
            end,
            desc = "Grep Current Buffer",
        },
        {
            "<leader>fw",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Grep Word Under Cursor",
        },
        {
            "<leader>fh",
            function()
                Snacks.picker.help()
            end,
            desc = "Help Tags",
        },
        {
            "<leader>fc",
            function()
                Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "Config Files",
        },
        {
            "<leader>fm",
            function()
                Snacks.picker.marks()
            end,
            desc = "Marks",
        },
        {
            "<leader>fd",
            function()
                Snacks.picker.smart({cwd = vim.loop.cwd()})
            end,
            desc = "Smart Files",
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>fs",
            function()
                Snacks.explorer()
            end,
            desc = "File Explorer",
        },
        {
            "<leader>ft",
            function()
                Snacks.picker()
            end,
            desc = "Picker Builtin",
        },
        {
            "<leader>fz",
            function()
                Snacks.picker.spelling()
            end,
            desc = "Spelling Suggestions",
        },
        {
            "<leader>f<space>",
            function()
                Snacks.picker.find_files()
            end,
            desc = "Find Files",
        },
        {
            "<leader>f<leader>",
            function()
                Snacks.picker.resume()
            end,
            desc = "Resume Picker",
        },
        {
            "<leader>fj",
            function()
                Snacks.picker.grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>fl",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
        {
            "<leader>fC",
            function()
                Snacks.picker.colorschemes()
            end,
            desc = "Colorschemes",
        },

        {
            "<leader>s",
            function()
                Snacks.scratch()
            end,
            desc = "Toggle Scratch Buffer",
        },
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "grr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gI",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>sS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
        {
            "<leader>d",
            function()
                require("snacks").bufdelete.delete()
            end,
            desc = "Delete current buffer",
        },
    },
}
