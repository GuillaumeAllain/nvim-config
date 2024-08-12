return {
    "nvim-neotest/neotest",
    lazy = true,
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
                    pytest_discover_instances = false,
                    args = { "--log-level", "DEBUG" },
                    python = function()
                        local lib = require("neotest.lib")
                        if lib.files.exists("pyproject.toml") then
                            local success, exit_code, data = pcall(
                                lib.process.run,
                                { "pixi", "info", "--json" },
                                { stdout = true }
                            )
                            if success and exit_code == 0 then
                                local pixi_info_json = data.stdout:gsub("\n", "")
                                local pixi_env_table = vim.json.decode(pixi_info_json)["environments_info"]
                                local pixi_return = ""
                                for i, v in ipairs(pixi_env_table) do
                                    local venv = vim.inspect(v["prefix"]):gsub('"', "")
                                    if string.find(venv, "test") then
                                        return require("plenary.path"):new(venv, "bin", "python").filename
                                    elseif string.find(venv, "default") then
                                        pixi_return = require("plenary.path"):new(venv, "bin", "python").filename
                                    end
                                end
                                if pixi_return ~= "" then
                                    return pixi_return
                                end
                            end
                        end
                        return ".venv/bin/python"
                    end,
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
        "nvim-neotest/neotest-python",
        "nvim-treesitter/playground",
        "nvim-neotest/nvim-nio",
    },
}
