return {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("noice").setup({
            popupmenu = {
                enabled = false, -- disable if you use something like cmp-cmdline
                ---@type 'nui'|'cmp'
                backend = "cmp", -- backend to use to show regular cmdline completions
                -- You can specify options for nui under `config.views.popupmenu`
            },
            lsp = {
                hover = {
                    enabled = true,
                },
                signature = {
                    enabled = false,
                },
                message = {
                    enabled = true,
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    ["vim.lsp.util.stylize_markdown"] = false,
                    ["cmp.entry.get_documentation"] = false,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
            },
            notify = {
                replace = true,
                merge = true,
            },
            lsp_progress = {
                enabled = false,
                -- format = "lsp_progress",
                -- format_done = "lsp_progress_done",
                -- throttle = 1000 / 30, -- frequency to update lsp progress message
                -- view = "mini",
            },
            throttle = 1000 / 30,
        })
    end,

    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        -- "hrsh7th/nvim-cmp",
    },
}
