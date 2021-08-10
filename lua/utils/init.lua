local api = vim.api
local m ={}

local function _get_kitty_theme ()
    local theme = {}
    theme[#theme+1]='background '..vim.fn.synIDattr(vim.fn.hlID('Normal'), 'bg')
    theme[#theme+1]='foreground '..vim.fn.synIDattr(vim.fn.hlID('Normal'), 'fg')
    theme[#theme+1]='selection_foreground '..vim.fn.synIDattr(vim.fn.hlID('Visual'), 'fg')
    theme[#theme+1]='selection_background '..vim.fn.synIDattr(vim.fn.hlID('Visual'), 'bg')
    theme[#theme+1]='cursor '..vim.fn.synIDattr(vim.fn.hlID('Cursor'), 'bg')
    for i=0,15 do
        theme[#theme+1]='color'..tostring(i)..' '..vim.fn.eval('g:terminal_color_'..tostring(i))
    end
    return theme
end

function m.export_theme_to_kitty (buf)
    api.nvim_command('e '..vim.fn.expand("$XDG_CACHE_HOME/kitty/nvim_theme.conf")) -- equivalent to :enew
    api.nvim_buf_set_lines(buf, 0, -1, false, _get_kitty_theme())
    api.nvim_command('silent !mkdir -p %:h')
    api.nvim_command('w')
    api.nvim_command('bd')
end

function m.macdict (word)
    api.nvim_command('silent !open -g dict://'..word)
    api.nvim_command('redraw!')
end

return m
