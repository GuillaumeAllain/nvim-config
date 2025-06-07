return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
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
        --         vim.keymap.set(
        --     "i",
        --     "<C-b>",
        --     "<cmd>lua require('telescope').extensions.bibtex.bibtex({format='markdown'})<cr>",
        --     { noremap = true, silent = true, desc = "bibtex" }
        -- )

        -- {
        --     "<leader>fb",
        --     "<cmd>lua require('telescope').extensions.bibtex.bibtex({format='markdown'})<cr>",
        --     desc = "bibtex",
        -- },
        {
            "<leader>fd",
            function()
                Snacks.picker.files()
            end,
            desc = "Find Files",
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>fk",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
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
                Snacks.picker.builtin()
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
        -- {
        --     "<leader>f<tab>",
        --     function()
        --         Snacks.picker.buffers()
        --     end,
        --     desc = "Buffers",
        -- },
        -- {
        --     "<leader>f<cr>",
        --     function()
        --         Snacks.picker.git_files()
        --     end,
        --     desc = "Git Files",
        -- },
        -- {
        --     "<leader>ff",
        --     function()
        --         Snacks.picker.find_files({ cwd = vim.fn.expand("%:p:h") })
        --     end,
        --     desc = "Find Files in Current Directory",
        -- },
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
            "gr",
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
    },
}
