-- Change the background of lualine_c section for normal mode
local custom_term = require'lualine.themes.auto'

custom_term.normal.a.bg = vim.g["terminal_color_6"]
custom_term.normal.a.fg = vim.g["terminal_color_0"]
custom_term.inactive.a.bg = vim.g["terminal_color_6"]
custom_term.inactive.a.fg = vim.g["terminal_color_0"]
custom_term.insert.a.bg = vim.g["terminal_color_15"]
custom_term.insert.a.fg = vim.g["terminal_color_0"]
custom_term.visual.a.bg = vim.g["terminal_color_14"]
custom_term.visual.a.fg = vim.g["terminal_color_0"]
custom_term.replace.a.bg = vim.g["terminal_color_3"]
custom_term.replace.a.fg = vim.g["terminal_color_0"]
custom_term.command.a.bg = vim.g["terminal_color_15"]
custom_term.command.a.fg = vim.g["terminal_color_0"]

custom_term.normal.b.bg = vim.g["terminal_color_0"]
custom_term.normal.b.fg = vim.g["terminal_color_15"]
custom_term.inactive.b.bg = vim.g["terminal_color_0"]
custom_term.inactive.b.fg = vim.g["terminal_color_15"]
custom_term.insert.b.bg = vim.g["terminal_color_0"]
custom_term.insert.b.fg = vim.g["terminal_color_15"]
custom_term.visual.b.bg = vim.g["terminal_color_0"]
custom_term.visual.b.fg = vim.g["terminal_color_15"]
custom_term.replace.b.bg = vim.g["terminal_color_0"]
custom_term.replace.b.fg = vim.g["terminal_color_15"]
custom_term.command.b.bg = vim.g["terminal_color_0"]
custom_term.command.b.fg = vim.g["terminal_color_15"]

custom_term.normal.c.bg = vim.g["terminal_color_0"]
custom_term.normal.c.fg = vim.g["terminal_color_7"]
custom_term.inactive.c.bg = vim.g["terminal_color_0"]
custom_term.inactive.c.fg = vim.g["terminal_color_7"]
custom_term.insert.c.bg = vim.g["terminal_color_0"]
custom_term.insert.c.fg = vim.g["terminal_color_7"]
custom_term.visual.c.bg = vim.g["terminal_color_0"]
custom_term.visual.c.fg = vim.g["terminal_color_7"]
custom_term.replace.c.bg = vim.g["terminal_color_0"]
custom_term.replace.c.fg = vim.g["terminal_color_7"]
custom_term.command.c.bg = vim.g["terminal_color_0"]
custom_term.command.c.fg = vim.g["terminal_color_7"]
require'lualine'.setup{
  options = {
    theme = custom_term,
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {"filename"},
        lualine_c = {},
        lualine_x = {'filetype',"progress","location"},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {"filename"},
        lualine_c = {},
        lualine_x = {'filetype',"progress","location"},
        lualine_y = {},
        lualine_z = {}
  },
}
vim.opt.laststatus=2
