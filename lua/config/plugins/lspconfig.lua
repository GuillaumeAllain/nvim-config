return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        {
            "barreiroleo/ltex_extra.nvim",
        },
        -- {
        --     url = "https://gitlab.com/yorickpeterse/nvim-dd.git",
        --     config = function()
        --         require("dd").setup({ timeout = 250 })
        --     end,
        -- },
    },
}
