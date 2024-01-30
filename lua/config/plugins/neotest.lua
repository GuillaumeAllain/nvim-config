return {
    "rcarriga/neotest",
    ft = "python",
    keys = { "<leader>t" },
    config = function()
        require("neotest").setup({
            icons = {
                child_indent = "│",
                child_prefix = "├",
                collapsed = "─",
                expanded = "╮",
                failed = "",
                final_child_indent = " ",
                final_child_prefix = "╰",
                non_collapsible = "─",
                passed = "",
                running = "",
                running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
                skipped = "",
                unknown = "",
            },
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                    runner = "pytest",
                    pytest_discover_instances = true,
                    args = {"--log-level", "DEBUG"},
                    ignore_file_types = { "txt" },
                }),
            },
        })
    end,
    dependencies = {
        "nvim-treesitter",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "rcarriga/neotest-python",
        "nvim-treesitter/playground",
    },
}
