local api = vim.api
local m ={}

local function _get_kitty_theme ()
    local theme = {}
    theme[#theme+1]='background '..vim.fn.synIDattr(vim.fn.hlID('Normal'), 'bg')
    theme[#theme+1]='foreground '..vim.fn.synIDattr(vim.fn.hlID('Normal'), 'fg')
    theme[#theme+1]='selection_foreground '..vim.fn.synIDattr(vim.fn.hlID('Visual'), 'fg')
    theme[#theme+1]='selection_background '..vim.fn.synIDattr(vim.fn.hlID('Visual'), 'bg')
    if vim.fn.synIDattr(vim.fn.hlID('Cursor'), 'bg') ~= 'fg' then
        theme[#theme+1]='cursor '..vim.fn.synIDattr(vim.fn.hlID('Cursor'), 'bg')
    end
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

function m.get_build_terminal ()
    -- Returns build terminal handle. If not found, it creates it
    local buffer_list = vim.fn.getbufinfo()
    local create_buffer = true
    local buffer_number = nil
    local current_mode = vim.fn.mode()

    for k in pairs(buffer_list) do
        if vim.fn.bufname(buffer_list[k].bufnr) == "BuildTerminal" then
            buffer_number = vim.fn.deepcopy(buffer_list[k].bufnr)
            if vim.api.nvim_buf_get_option(buffer_number,'buftype')=="terminal" then
                create_buffer = false
            else
               vim.api.nvim_buf_delete(buffer_number, {})
            end
            break
        end
    end

    if create_buffer then
        buffer_number = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_buf_call (buffer_number,
        function()
            vim.fn.termopen("$SHELL")
        end)
        if current_mode~='i' then
            vim.fn.execute("stopinsert")
        end
        vim.api.nvim_buf_set_name(buffer_number, "BuildTerminal")
    end

    return buffer_number
end

function m.send_command_to_build_terminal (command)
    local build_buffer = require'utils'.get_build_terminal()
    local build_buffer_job_id = vim.api.nvim_buf_call (build_buffer,
    function()
        return vim.b.terminal_job_id
    end)
    local current_mode = vim.fn.mode()

    vim.api.nvim_chan_send(build_buffer_job_id, command.."\n")

    if current_mode~='i' then
        vim.fn.execute("stopinsert")
    end
end

function m.open_build_buffer_window ()
    local build_buffer = require'utils'.get_build_terminal()
    local cur_window = vim.fn.winnr()

    vim.fn.execute("botright vsplit | buffer "..tostring(build_buffer))
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.fn.execute("norm G")
    -- vim.fn.execute("stopinsert")
    vim.fn.execute(tostring(cur_window).." wincmd w")
end

function m.toggle_build_buffer_window()
    local win_info = vim.fn.getwininfo()
    local build_buffer = require'utils'.get_build_terminal()
    local window_closed = false

    for k in pairs(win_info) do
        if win_info[k].bufnr == build_buffer then
            vim.api.nvim_win_close(win_info[k].winid,nil)
            window_closed = true
        end
    end
    if not window_closed then
        m.open_build_buffer_window()
    end
end

return m
