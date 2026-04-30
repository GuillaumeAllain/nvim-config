return {
    -- { "markonm/traces.vim", lazy = true, keys = { ":", "/", "?" } },
    {
        "neovim/nvim-lspconfig",
        event = { "LazyFile", "BufEnter" },
        dependencies = { "Saghen/blink.cmp" },
        config = function()
            require("config.lsp")
        end,
    },
    {
        "m4xshen/hardtime.nvim",
        event = "LazyFile",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disable_mouse = false,
            disabled_filetypes = {
                markdown = true,
                pandoc = true,
                typst = true,
            },
            hints = {
                ["[dcyvV][ia][%(%)]"] = {
                    message = function(keys)
                        return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
                    end,
                    length = 3,
                },
                ["[dcyvV][ia][%{%}]"] = {
                    message = function(keys)
                        return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys
                    end,
                    length = 3,
                },
            },
        },
    },
    { "wellle/targets.vim", event = "LazyFile" },
    { "tpope/vim-eunuch",   event = "LazyFile" },
    {
        "folke/trouble.nvim",
        opts = {},
        lazy = true,
        cmd = "Trouble",
        keys = {
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
                "<leader>gg",
                "<cmd>lua require('trouble').focus()<cr>",
                desc = "Focus Trouble",
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "LazyFile",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            signcolumn = false,
            numhl = false,
            current_line_blame = true,
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Next Hunk" })

                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Prev Hunk" })

                -- Actions
                map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
                map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
                map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
                map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
                map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
                map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end, { desc = "Blame Line" })
                map("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
                map("n", "<leader>hD", function()
                    gs.diffthis("~")
                end, { desc = "Diff This ~" })
            end,
        },
        config = function(_, opts)
            require("gitsigns").setup(opts)
            local function get_color(group, attr)
                local fn = vim.fn
                local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
                if attr == "fg" then
                    return string.format("#%06x", hl.fg or 0)
                end
                return "none"
            end
            -- Note: Simplified hl setup as nvim_get_hl is more modern than synIDattr
        end,
    },
    {
        "dhruvasagar/vim-table-mode",
        lazy = true,
        ft = { "markdown", "pandoc", "tex" },
        config = function()
            require("which-key").add({
                { "<leader>t", group = "table mode" },
            })
            vim.cmd([[let g:table_mode_map_prefix = '<Leader>tm']])
        end,
    },
    {
        "ray-x/yamlmatter.nvim",
        lazy = true,
        ft = { "markdown", "pandoc" },
        config = function()
            require("yamlmatter").setup({})
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        cmd = "Markview",
        -- event = "LazyFile",
        -- priority = 4,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            {
                "<leader>pm",
                function()
                    vim.cmd("Markview toggle")
                    Snacks.image.hover()
                end,
                desc = "Toggle Markview",
            },
        },
        ft = {
            'md',
            'markdown',
            'norg',
            'rmd',
            'org',
            'vimwiki',
            'typst',
            'tex',
            'quarto',
            'Avante',
            'codecompanion',
        },
        config = function()
            require("markview").setup({
                modes = { "n", "i", "no", "c" },
                hybrid_modes = { "i", "n" },
                checkboxes = require("markview.presets").checkboxes.nerd,
                ignore_buftypes = {},
                preview = {
                    hybrid_modes = { "i" },
                    modes = { "i", "n", "no", "v", "c" },
                    filetypes = { "markdown", "quarto", "rmd", "pandoc", "codecompanion" },
                    icon_provider = "internal",
                },
            })
            require("markview.extras.editor").setup()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "codecompanion",
                callback = function(ev)
                    require("markview.actions").attach(ev.buf)
                end,
            })
        end,
    },
    {
        "heterophyllus/vscode-codev",
        lazy = true,
        ft = { "codev" },
    },
    {
        "GuillaumeAllain/vim-codevmacro",
        lazy = true,
        branch = "dev",
        ft = { "codev" },
    },
}
