return {
    "GuillaumeAllain/panotes",
    cmd = { "Panotes" },
    keys = { "<leader>p" },
    config = function()
        require("panotes").setup()
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
}
