require("tokyonight").setup({
    style = "night",
    transparent = true,
    on_colors = function(colors)
        local lighten = require("tokyonight.util").lighten
        for _, k in ipairs({ "comment", "fg_gutter", "terminal_black", "dark3" }) do
            colors[k] = lighten(colors[k], 0.5)
        end
        colors.bg_statusline = colors.none
    end,
    -- mini.statusline styled like the old lualine theme: coloured mode block,
    -- then mode-coloured text (StatuslineB*) on a transparent background.
    on_highlights = function(hl, c)
        for mode, color in pairs({
            Normal = c.blue,
            Insert = c.green,
            Command = c.yellow,
            Visual = c.magenta,
            Replace = c.red,
            Other = c.green1,
        }) do
            hl["MiniStatuslineMode" .. mode] = { fg = c.black, bg = color }
            hl["StatuslineB" .. mode] = { fg = color }
        end
        hl.MiniStatuslineFileinfo = { fg = c.fg_sidebar }
        hl.MiniStatuslineInactive = { fg = c.fg_gutter }
    end,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "transparent",
        floats = "transparent",
    },
})
vim.cmd.colorscheme("tokyonight")
