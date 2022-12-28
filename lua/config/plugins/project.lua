return {
            "ahmedkhalf/project.nvim",
            lazy=false,
            config = function()
                require("project_nvim").setup({
                    detection_methods = { "pattern" },
                    patterns = { ".git", ".notes" },
                    datapath = vim.fn.stdpath("cache"),
                })
            end,
}
