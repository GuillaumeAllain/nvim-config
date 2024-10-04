return {
    "GuillaumeAllain/panotes",
    lazy = true,
    cmd = { "Panotes" },
    keys = { "<leader>p" },
    config = function()
        require("panotes").setup()
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    dev=true
}
