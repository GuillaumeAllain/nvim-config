return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local colors = require("tokyonight").setup({
            style = "night",
            transparent = true,
            on_colors = function(colors)
                colors.comment = require("tokyonight.util").lighten(colors.comment, 0.5)
                colors.fg_gutter = require("tokyonight.util").lighten(colors.fg_gutter, 0.5)
                colors.fg = require("tokyonight.util").lighten(colors.fg, 0.5)
                colors.terminal_black = require("tokyonight.util").lighten(colors.terminal_black, 0.5)
                colors.dark3 = require("tokyonight.util").lighten(colors.dark3, 0.5)
                colors.bg_statusline = colors.none -- ou "NONE"
            end,
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "transparent", -- style for sidebars, see below
                floats = "transparent", -- style for floating windows
            },
        })
        local util = require("tokyonight.util")

        vim.cmd.colorscheme("tokyonight")
    end,
    -- config=function()
    --     require
    -- end
    -- config = function()
    --     vim.cmd.colorscheme("tokyonight-night")
    -- end,
}
