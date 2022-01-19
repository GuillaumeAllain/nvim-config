-- Change the background of lualine_c section for normal mode
local custom_term = require("lualine.themes.auto")

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

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

require("lualine").setup({
    options = {
        theme = custom_term,
        component_separators = { "", "" },
        section_separators = { "", "" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            function()
                return "%="
            end,
            { "filename", condition = conditions.buffer_not_empty },
        },
        lualine_c = {},
        lualine_x = {
            "filetype",
            {
                function()
                    local msg = "No Active Lsp"
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            if client.name ~= "null-ls" then
                                return client.name
                            end
                        end
                    end
                    return msg
                end,
                icon = "  LSP:",
                condition = conditions.buffer_not_empty,
            },
            {
                function()
                    local tab = vim.fn.tabpagenr()
                    local totaltab = vim.fn.tabpagenr("$")
                    if totaltab ~= 1 then
                        return "Tab: "..tostring(tab).."/"..tostring(totaltab)
                    else
                        return ""
                    end
                end
            }
        },
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = {
            function()
                return "%="
            end,
            { "filename", condition = conditions.buffer_not_empty },
        },
        lualine_c = {},
        lualine_x = {
            "filetype",
        },
        lualine_y = {},
        lualine_z = {},
    },
})
