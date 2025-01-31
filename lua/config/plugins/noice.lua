return {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        popupmenu = {
            enabled = false, -- disable if you use something like cmp-cmdline
            backend = "cmp", -- backend to use to show regular cmdline completions
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
        },
        throttle = 1000 / 30,
    },

    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- "rcarriga/nvim-notify",
        -- "hrsh7th/nvim-cmp",
    },
}
